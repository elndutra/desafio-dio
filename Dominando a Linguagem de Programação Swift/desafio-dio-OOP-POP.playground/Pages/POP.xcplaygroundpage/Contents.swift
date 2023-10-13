//: [Previous](@previous)

import Foundation

protocol EmployeeProtocol {
    var name: String { get set }
    var cpf: Int { get set }
    var salary: Double { get set}
    var password: Int { get set }
    var department: Department { get set }
    func authenticate(password: Int) -> Bool
    init(name: String, cpf: Int, salary: Double, password: Int, department: Department)
    
}

protocol SuportProtocol {
    func deploySoftware ()
    func provisionOfEquipment()
}

protocol HumanResources{
    func hireEmployees()
    func layOffEmployees()
    func displayNameEmployeesTitleJob()
}


enum Department: String {
    case rh = "RH"
    case suport = "Suporte Técncio"
    case dev = "Desenvolvimento"
    case presidency = "Presidência"
    case board = "Diretoria"
    case management = "Gerência"
}
/*----------------------------------------------------------------------------------------*/

//   Aqui definimos a estrutrua gerente que está de acordo com o protocolo EmpoyeeProtocol

/*----------------------------------------------------------------------------------------*/

struct Manager : EmployeeProtocol {
   
    var name: String = ""
    var cpf: Int = 0
    var salary: Double = 0.0
    var password: Int = 0
    var department: Department
    var funcionarioAll : [Department: [String]] = [
        .suport : ["Pedro Carlos", "João Rodrigues", "Marcelo Aquiar"],
        .board : ["Adilson Ferreia","Alexandre Morais", "Pedro Alboquerque"],
        .dev : ["Adriano Trindade", "Petter Assunção","Julio Azevedo"],
        .management : ["Carlos Aguiar", "Lucas Lima", "Atonio Mariano"],
        .rh : ["Maria Belute", "Renata Curato","Xirlei Aguiar"],
        .presidency : ["Domigo Jorges","Mauro Filho"]
            ]
    
    func authenticate (password: Int) -> Bool {
        if ( self.password == password ) {
            print("Acesso permitido!")
            return true
        }else{
            print("Acesso negado!")
            return false
        }
    
    }
    
    
    init(name: String, cpf: Int, salary: Double, password: Int, department: Department){
        self.name = name
        self.cpf = cpf
        self.salary = salary
        self.password = password
        self.department = department
        add(name: name, department: department)
    }

}
/*----------------------------------------------------------------------------------------*/

//   Aqui definimos a estrutrua Executive que está em conformidade  com o protocolo EmpoyeeProtocol

/*----------------------------------------------------------------------------------------*/
struct Executive: EmployeeProtocol {
    var department: Department
    var name: String
    var cpf: Int
    var salary: Double
    var password: Int
    var funcionarioAll : [Department: [String]] = [
        .suport : ["Pedro Carlos", "João Rodrigues", "Marcelo Aquiar"],
        .board : ["Adilson Ferreia","Alexandre Morais", "Pedro Alboquerque"],
        .dev : ["Adriano Trindade", "Petter Assunção","Julio Azevedo"],
        .management : ["Carlos Aguiar", "Lucas Lima", "Atonio Mariano"],
        .rh : ["Maria Belute", "Renata Curato","Xirlei Aguiar"],
        .presidency : ["Domigo Jorges","Mauro Filho"]
            ]
    func authenticate(password: Int) -> Bool {
        if ( self.password == password ) {
            print("Acesso permitido!")
            return true
        }else{
            print("Acesso negado!")
            return false
        }
    }
    
    
    init(name: String, cpf: Int, salary: Double, password: Int, department: Department) {
        self.name = name
        self.cpf = cpf
        self.salary = salary
        self.password = password
        self.department = department
        add(name: name, department: department)
    }
}
/*----------------------------------------------------------------------------------------*/

//   Aqui definimos a estrutrua Suporte que está em conformidade com o protocolo EmpoyeeProtocol

/*----------------------------------------------------------------------------------------*/
struct Suport: EmployeeProtocol, SuportProtocol {
    var name: String
    var cpf: Int
    var salary: Double
    var password: Int
    var department: Department
    var funcionarioAll : [Department: [String]] = [
        .suport : ["Pedro Carlos", "João Rodrigues", "Marcelo Aquiar"],
        .board : ["Adilson Ferreia","Alexandre Morais", "Pedro Alboquerque"],
        .dev : ["Adriano Trindade", "Petter Assunção","Julio Azevedo"],
        .management : ["Carlos Aguiar", "Lucas Lima", "Atonio Mariano"],
        .rh : ["Maria Belute", "Renata Curato","Xirlei Aguiar"],
        .presidency : ["Domigo Jorges","Mauro Filho"]
            ]
    func authenticate(password: Int) -> Bool {
        if ( self.password == password ) {
            print("Acesso permitido!")
            return true
        }else{
            print("Acesso negado!")
            return false
        }
    }
    
    func deploySoftware() {
        print("Instalações enviadas")
    }
    
    func provisionOfEquipment() {
        print("Disponibilizado equipamento")
    }
    
    init(name: String, cpf: Int, salary: Double, password: Int, department: Department) {
        self.name = name
        self.cpf = cpf
        self.salary = salary
        self.password = password
        self.department = department
        add(name: name, department: department)
    }
    
    
}
/*----------------------------------------------------------------------------------------*/

//   Aqui definimos a estrutrua RH que está em conformidade com o protocolo EmpoyeeProtocol

/*----------------------------------------------------------------------------------------*/
struct RH : EmployeeProtocol, HumanResources {
    var name: String
    var cpf: Int
    var salary: Double
    var password: Int
    var department: Department
    var funcionarioAll : [Department: [String]] = [
        .suport : ["Pedro Carlos", "João Rodrigues", "Marcelo Aquiar"],
        .board : ["Adilson Ferreia","Alexandre Morais", "Pedro Alboquerque"],
        .dev : ["Adriano Trindade", "Petter Assunção","Julio Azevedo"],
        .management : ["Carlos Aguiar", "Lucas Lima", "Atonio Mariano"],
        .rh : ["Maria Belute", "Renata Curato","Xirlei Aguiar"],
        .presidency : ["Domigo Jorges","Mauro Filho"]
            ]
    func authenticate(password: Int) -> Bool {
        if ( self.password == password ) {
            print("Acesso permitido!")
            return true
        }else{
            print("Acesso negado!")
            return false
        }
    }
    
    init(name: String, cpf: Int, salary: Double, password: Int, department: Department) {
        self.name = name
        self.cpf = cpf
        self.salary = salary
        self.password = password
        self.department = department
        add(name: name, department: department)
    }
    
    func hireEmployees() {
        print("Você está contratado")
    }
    
    func layOffEmployees() {
        print("Você está dispensado")
    }
    
    func displayNameEmployeesTitleJob() {
        for (department,name) in funcionarioAll {
            print("\(name) eles são do departamento \(department)")
        }
    }
    
    
}

var funcionarioAll : [Department: [String]] = [
    .suport : ["Pedro Carlos", "João Rodrigues", "Marcelo Aquiar"],
    .board : ["Adilson Ferreia","Alexandre Morais", "Pedro Alboquerque"],
    .dev : ["Adriano Trindade", "Petter Assunção","Julio Azevedo"],
    .management : ["Carlos Aguiar", "Lucas Lima", "Atonio Mariano"],
    .rh : ["Maria Belute", "Renata Curato","Xirlei Aguiar"],
    .presidency : ["Domigo Jorges","Mauro Filho"]
        ]

/*----------------------------------------------------------------------------------------*/

//   Aqui definimos uma extension EmployeeProtocol para adocopmar funcionarios em departamentos que for selecionado

/*----------------------------------------------------------------------------------------*/
extension EmployeeProtocol {
    
    mutating func add(name: String, department: Department){
        funcionarioAll[department]?.append(name)
    }
    
    func displayEmployee(department: Department){
        let name = funcionarioAll[department]
        
        print(name ?? "Não tem nada para imprimir")
    }
}
/*----------------------------------------------------------------------------------------*/

//   Aqui definimos um gereciamento de funcionarios podemos move-lo de departamentos até removelos..

/*----------------------------------------------------------------------------------------*/
actor EmployeeManagement{
    var funcionarioAll : [Department: [String]] = [
        .suport : ["Pedro Carlos", "João Rodrigues", "Marcelo Aquiar"],
        .board : ["Adilson Ferreia","Alexandre Morais", "Pedro Alboquerque"],
        .dev : ["Adriano Trindade", "Petter Assunção","Julio Azevedo"],
        .management : ["Carlos Aguiar", "Lucas Lima", "Atonio Mariano"],
        .rh : ["Maria Belute", "Renata Curato","Xirlei Aguiar"],
        .presidency : ["Domigo Jorges","Mauro Filho"]
            ]
    
    lazy var displaySimple = {(department : Department) in
        
        await self.listEmployees(department: department).hashValue
       
        }
 
    
    func listEmployees (department: Department ) async -> [String]{
        let employee = funcionarioAll[department] ?? []
        print(employee)
        return employee
    }
    
    func add(department: Department, name: String){
        funcionarioAll[department]?.append(name)
    }
    
    func remove(department: Department, name: String){
        
        guard let index = funcionarioAll[department]?.firstIndex(of: name) else { return  }
        
        funcionarioAll[department]?.remove(at: index)
    }


    func move(department: Department, name: String, from employee:EmployeeManagement) async {
        await employee.remove(department: department, name: name)
            add(department: department, name: name)
        }

    func move(department: Department, name: String, to employee: EmployeeManagement) async {
            await employee.add(department: department, name: name)
            remove(department: department, name: name)
        }
}

let gerente = Manager(name: "Paulo Antonio", cpf: 03003737366, salary:  5000.00, password: 123456, department:.management)

let suporte = Suport(name: "Adriano Pereira", cpf: 38383838383, salary: 4000, password: 123, department: .suport)
let rh = RH(name: "Maria Eduarda", cpf: 93939393939, salary: 7000.00, password: 32323, department: .rh)
gerente.authenticate(password: 123456)


gerente.displayEmployee(department: .management)
suporte.displayEmployee(department: .suport)
rh.displayNameEmployeesTitleJob()
rh.layOffEmployees()
let employeeManagent = EmployeeManagement()
let emplyeeManagent2 = EmployeeManagement()


Task {
    await employeeManagent.listEmployees(department:.suport)
    await employeeManagent.move(department: .dev, name: "Adriano Trindade", from: employeeManagent)
    await employeeManagent.move(department: .board, name: "Adriano Trindade", to: emplyeeManagent2)
    await employeeManagent.listEmployees(department:.dev)
    await emplyeeManagent2.listEmployees(department:.board)
    await employeeManagent.displaySimple(.presidency)
}
