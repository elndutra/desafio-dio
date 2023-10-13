# desafio-dio
```Swift
let name = "Steve"
var lastName: String? = "Jobs"
var defaultValue = "Wozniak"
let unwrappedValue: String = lastName ?? defaultValue

print("Este é o nome do criador da Apple \(name) \(unwrappedValue)")

if let actualLastName = lastName {
    print("Este é o nome do criador da Apple \(name) \(unwrappedValue)")
} else {
    print("Não contém uma String.")
}
```


