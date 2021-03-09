# Swift-VendingMachine

## Step1

### 프로그래밍 요구사항
- 객체지향 프로그래밍 방식으로  음료를 추상화하는 클래스(class)를 설계한다.
- 음료 상품 클래스 출력을 위해서 CustomStringConvertible 프로토콜을 추가하고 구현한다.

## Step2
### 프로그래밍 요구사항
- 음료수 클래스 계층을 음료수 최상위 객체부터 그룹을 만들어서 3단계 이상 구분한다.
```
예시) 음료 (1단계)    
+---- 우유, 탄산음료, 커피, 에너지드링크 (2단계)
+---- 딸기우유,초코우유 / 콜라,사이다 / TOP,칸타타,조지아 (3단계)
```

- 상속 받은 하위 클래스에도 상위 클래스에 없는 적어도 하나 이상의 속성을 추가한다.
- 추가한 속성에 대한 인터페이스와 함께 추가 인터페이스를 작성한다.
- 음료수 클래스 인터페이스를 테스트하기 위한 테스트 코드를 작성한다.
- 팩토리 패턴을 적용한다.

#### 자판기
- 자판기 구조체를 설계하고, 다음과 같은 동작을 위한 메소드를 작성한다.
    - 자판기 금액을 원하는 금액만큼 올리는 메소드
    - 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    - 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    - 음료수를 구매하는 메소드
    - 잔액을 확인하는 메소드
    - 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    - 유통기한이 지난 재고만 리턴하는 메소드
    - 따뜻한 음료만 리턴하는 메소드
    - 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    - 각 메소드 동작을 검증할 수 있는 테스트 함수를 작성한다.
    - 전체 코드를 확인할 수 있는 통합 테스트 시나리오를 가지고 동작을 확인한다.

### Class Diagram

<img width="963" alt="Screen Shot 2021-02-27 at 11 14 30 PM" src="https://user-images.githubusercontent.com/60229909/109389838-8f64ec80-7951-11eb-86f4-a07e32a2385b.png">

## Step3

### 프로그래밍 요구사항
- 각 상품에 대한 재고 추가 버튼을 추가한다.
- 각 상품에 대한 이미지를 추가한다.
- 각 상품에 대한 재고 레이블을 추가한다.
- 1000원, 5000원 금액을 입력하는 버튼을 추가한다.
- 현재 잔액을 표시할 레이블을 추가한다.
- 각 상품의 재고 추가 버튼을 누르면 각 상품 재고를 추가하도록 코드를 구현한다.
- 재고 추가 버튼을 누르고 나면 전체 레이블을 다시 표시한다.
- 금액 입력 버튼을 누르면 해당 금액을 추가하도록 코드를 구현한다.
- 금액을 추가하고 나면 잔액 레이블을 다시 표시한다.

### 결과

<img width="1104" alt="Screen Shot 2021-03-08 at 3 43 48 PM" src="https://user-images.githubusercontent.com/60229909/110284382-13d7ff00-8025-11eb-8d6b-76ad7aa08761.png">

## 고찰

### 🔑 Beverage.Type을 Dictionary의 Key값으로 사용하기

Beverage.Type을 Dictionary의 Key값으로 사용하고자 한다. Beverage.Type은 Hashable하지 않기 때문에 Key로 사용할 수 없다. 메타 타입 자체는 hashable하지 않으므로 key로 사용할 수 없다. 두 가지 접근 방법을 생각하였다.

1. **메타 타입을 확장하여 hashable하게 정의 해보자.** → 메타 타입은 확장하여 사용할 수 없다.
2. **Dictionary를 확장하여 Type을 key값으로 가질 수 있도록 구현한다.** → 구현하기가 어렵다.

ObjectIdentifier(Type) 를 사용하면 Key값으로 사용 할 수 있으나, 이는 ObjectIdentifier가 Key값이 된다. 현재로써는 가장 최선의 방법이다.

### 🪐 동일한 인터페이스에 고유한 기능 넣기

같은 '추가하기' 버튼이지만, 버튼마다 추가 되는 상품이 다르다. 이를 위해서는 버튼은 음료의 타입을 알아야한다.
1. 버튼이 음료타입에 대한 정보를 가지고 있는 방법
2. 버튼 인스턴스가 보낸 이벤트에 따라서 음료 타입을 매칭하는 방법

이벤트에 따라 핸들링하는 것이 익숙치 않아 1번의 방법으로 구현하였다.

### 🌅 이미지 저장

사용자가 이용하는 화면에서 음료의 이미지를 보여주어야 한다. 이는 각 타입마다 고유의 이미지를 가지고 있어야 함을 의미한다. 그렇다면 이 이미지는 어디에 저장되어야 할까?

1. 클래스에 상수로 image를 가지고 있도록 한다 → 인스턴스를 생성할 때마다 클래스가 이미지를 가지고 있어야하는데, 이는 음료가 많아질 수록 굉장한 메모리 낭비를 초래할 수 있다.
2. View와 관련된 클래스에서 직접 이미지를 넣는다.
    ```swift
    private let images : [UIImage?] = [UIImage(named: "top"),UIImage(named: "georgia"),UIImage(named: "cantata"), .... ]
    ```
 다소 하드코딩의 느낌이 나지만, 현 단계에서는 2번의 방법을 택했다. 모든 인스턴스들이 가지고 있는것 보다는 나아 보였기 때문이다.

