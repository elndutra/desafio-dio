import UIKit

class Person {
    var firstName: String
    var lastName: String
    
    
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
   
    func activity () -> String  {
            return "Estou caminhando por aí!"
        
    }
    
    func sleep () -> String  {
        
        return "E hora de dormir"
    }
}

// Matérias utilizadas para estrutura, pois iremos construi um objeto Estudante e nele tambem utilizaremos algumas turma pré existente para inicialização

enum Subject: String {
    case mathematics = "Matemática"
    case portuguese = "Português"
    case geography = "Geografia"
    case physicalEducation = "Educação Física"
}

enum Class{
        case a, b, c
    }

// uma estrura de notas que utilizaremos para o estutande, essa estrutura possui controle de fluxo para ser inicializada..

struct Grade {
    var points: Double
    var subjectSchool: Subject

    init(points :Double ,subjectSchool:Subject) {
         //Do your own validation here
         if (points < 0 ){
             self.points = -1.0
         } else if points > 10 {
             self.points = -2.0
         }else{
             self.points = points
         }
        self.subjectSchool = subjectSchool
     }
}
   
// Aqui definimos o estutande que herda as caracteristica da classe Person

class Student: Person {
    private(set) var grades: [Grade] = []
    var team : Class
    var average : Double {
   
        let point = grades.reduce(0,{$0 + $1.points})
        let avge = point / Double(grades.count)
        return avge
    }
    

 // Incluiremos as notas na proprieda de array grades por aqui
func recordGrade(_ grade: Grade) {
        grades.append(grade)

  
    }
// Obtemos as notas de todas a matéria incluidas em um aluno
func getGradeAll() {
        for grade in grades {
            if grade.points >= 0.0 {
                
                switch grade.subjectSchool {
                case .geography:
                    print("Parabens você foi bem bem em Geografia")
                    if grade.points < 5.0 {
                        print("Espero que melhore essa nota na próxima avaliação")
                    }else if grade.points > 7.0 && grade.points < 10.0{
                        print("Isso mostra seu desempenho, e  você está acima da média")
                    }else{
                        print("Aqui você supresou todas as espectativa..!!!!")
                    }
                case .mathematics:
                    print("Parabens você foi bem bem em Matemática")
                    if grade.points < 5.0 {
                        print("Espero que melhore essa nota na próxima avaliação")
                    }else if grade.points > 7.0 && grade.points < 10.0{
                        print("Isso mostra seu desempenho, e  você está acima da média")
                    }else{
                        print("Aqui você supresou todas as espectativa..!!!!")
                    }
                case .physicalEducation:
                    print("Parabens você foi bem bem em Educação Fisíca")
                    if grade.points < 5.0 {
                        print("Espero que melhore essa nota na próxima avaliação")
                    }else if grade.points > 7.0 && grade.points < 10.0{
                        print("Isso mostra seu desempenho, e  você está acima da média")
                    }else{
                        print("Aqui você supresou todas as espectativa..!!!!")
                    }
                case.portuguese:
                    print("Parabens você foi bem bem em Portugues")
                    if grade.points < 5.0 {
                        print("Espero que melhore essa nota na próxima avaliação")
                    }else if grade.points > 7.0 && grade.points < 10.0{
                        print("Isso mostra seu desempenho, e  você está acima da média")
                    }else{
                        print("Aqui você supresou todas as espectativa..!!!!")
                    }
                }
            }else if grade.points == -1.0 {
                print("Valor inválido, por favor insira um valor correto de 0 a 10")
                print("O valor inserido é menor que 0")
            }else{
                print("Valor inválido, por favor insira um valor correto de 0 a 10")
                print("O valor inserido é maior que 10")
            }
        }

    }

// Aqui subscrevemos a funça da classe mãe, pois e mais conveniente um estutande estruca nas suas atividade diárias
override func activity() -> String {
        return "Agora irei estudar"
        
        
    }

// Aqui e um exibição mais simples e detalhada
    lazy var displayDetails = {
        
        print("\(self.firstName) está é a listagem e sua nota por matéria")
        for grade in self.grades {
            print("Em \(grade.subjectSchool.rawValue) você tirou \(grade.points)")
        }
    }
    
init(firstName: String, lastName: String, team: Class){
        self.team = team
        super.init(firstName: firstName, lastName: lastName)
        
    }
}


// Uma simpels adição de matéria favoritas que os alundos podem utlizar..
actor SubjectMatters {
    
    private(set) var mattersSubject = [
        "Matematica" : ["Trigonometria", "Geometria","Porcentagem" ],
        "Portugues" : ["Variação linguística", "Intertextualidade", "Funções da linguagem", "Figuras de linguagem"],
        "Geografia" :  ["Agricultura", "Energia", "Transportes", "Urbanização e violência"]
        
    ]
    
    
    
    func listSubjectMatters (subject: String ) async -> [String]{
        self.mattersSubject[subject] ?? []
    }
    
    func add(subject: String, subjectMatter: String){
        self.mattersSubject[subject]?.append(subjectMatter)
    }
    
    func remove(subject: String, subjectMatter: String){
        
        guard let index = mattersSubject[subject]?.firstIndex(of: subjectMatter) else { return  }
        
        mattersSubject[subject]?.remove(at: index)
    }


    func move(subject: String, subjectMatter: String, from subjectMatters: SubjectMatters) async {
            await subjectMatters.remove(subject: subject, subjectMatter: subjectMatter)
            add(subject: subject, subjectMatter: subjectMatter)
        }

    func move(subject: String, subjectMatter: String, to subjectMatters: SubjectMatters) async {
            await subjectMatters.add(subject: subject, subjectMatter: subjectMatter)
            remove(subject: subject, subjectMatter: subjectMatter)
        }
}

let favorites = SubjectMatters()
let partyP = SubjectMatters()


Task{
    await favorites.listSubjectMatters(subject: "Matematica")
    await favorites.move(subject: "Portugues", subjectMatter: "Intertextualidade", from: partyP)
    await favorites.move(subject:"Matematica", subjectMatter: "Porcentagem" ,to: partyP)
    await print(favorites.listSubjectMatters(subject: "Matematica"))
    await print(favorites.listSubjectMatters(subject: "Portugues"))
    await print(partyP.listSubjectMatters(subject: "Matematica"))
    await print(partyP.listSubjectMatters(subject: "Portugues"))
}


var materia1 = Grade(points: 10.0, subjectSchool: .geography)
var materia2 = Grade(points: 9.0, subjectSchool: .portuguese)
var materia3 = Grade(points: -1, subjectSchool: .portuguese)


let elielton = Student (firstName: "Elielton", lastName: "Dutra", team: .a)


elielton.recordGrade(materia1)
elielton.recordGrade(materia2)
elielton.recordGrade(materia3)

elielton.getGradeAll()
elielton.displayDetails()
