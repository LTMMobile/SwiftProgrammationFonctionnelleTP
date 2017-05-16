//
//  main.swift
//  LTMProgrammationFonctionelleTP
//

import Foundation

let poeme = ["Mon père, ce héros au sourire si doux,",
    "Suivi d’un seul housard qu’il aimait entre tous",
    "Pour sa grande bravoure et pour sa haute taille,",
    "Parcourait à cheval, le soir d’une bataille,",
    "Le champ couvert de morts sur qui tombait la nuit.",
    "Il lui sembla dans l’ombre entendre un faible bruit.",
    "C’était un Espagnol de l’armée en déroute",
    "Qui se traînait sanglant sur le bord de la route,",
    "Râlant, brisé, livide, et mort plus qu’à moitié.",
    "Et qui disait: « A boire! à boire par pitié !  »",
    "Mon père, ému, tendit à son housard fidèle",
    "Une gourde de rhum qui pendait à sa selle,",
    "Et dit: « Tiens, donne à boire à ce pauvre blessé.  »",
    "Tout à coup, au moment où le housard baissé",
    "Se penchait vers lui, l’homme, une espèce de maure,",
    "Saisit un pistolet qu’il étreignait encore,",
    "Et vise au front mon père en criant: « Caramba!  »",
    "Le coup passa si près que le chapeau tomba",
    "Et que le cheval fit un écart en arrière.",
    "« Donne-lui tout de même à boire », dit mon père."]

// Utilisez la PF pour (recalculer un nouveau tableau à chaque fois) :
// Evitez la programmation impérative, utilisez la PF !

// 1. Récupérer un tableau contenant les mots avec une lettre majuscule
// 2. Compter le nombre de caractères .
// 3. Retirer tous les caractères , . ! « » et trier par ordre alphabétique

/// Calcule un tableau des mots d'une chaîne
/// Ici fonction complexe et vraiment à éviter
func getWords( input:String ) -> [String] {
    guard input.characters.count != 0 else {
        return [""]
    }
    
    var s:String = "";
    var tab:[String] = [String]()
    var chaine = input
    chaine.append(" ")
    
    while let espace = chaine.characters.index(of: " ") {
        s = String(chaine.characters.prefix(upTo: espace))
        chaine = String(chaine.characters.suffix(from: espace))
        chaine.characters.removeFirst()
        tab.append(s)
    }
    
    return tab
}

//for item in poeme {
//    print(getWords(input: item))
//}

print("###########################")

/// Pour calculer un tableau des mots d'une chaine on utilisera plutôt la fonction de PF .components(..)
let composants = poeme[0].components(separatedBy: CharacterSet.whitespaces)
print(composants)

print("1. ###########################")
var ret = composants.filter { (s:String) -> Bool in
    return String(describing: s.characters.first!).uppercased() == String(describing: s.characters.first!)
}

// Pour tous les éléments ici
let ret2 = poeme.flatMap({ $0.components(separatedBy: CharacterSet.whitespaces) })
let ret3 = ret2.filter{ (s:String) -> Bool in
    guard s != "" else {
        return false;
    }
    return String(describing: s.characters.first!).uppercased() == String(describing: s.characters.first!)
}
print(ret3)

print("2. ###########################")
var resultat = poeme[0].characters.filter({ (c:Character) -> Bool in
        return c == ","
})

//print(resultat)

var z = poeme.flatMap({ $0.characters.filter({ (c:Character) -> Bool in
    return c == "."
})})

print(z)
print(z.count)

print("3. ###########################")
var z2 = poeme.flatMap({
    
    String($0.characters.filter({ (c:Character) -> Bool in
        return c != "." && c != "," && c != "!" && c != "«" && c != "»"
    }))


}).sorted()

print(z2)


// Liste de fibonacci
// Calculer la liste de fibonacci (ex : on cherche le 44èeme élement)
// en utilisant la PF et la récursivité

func fibonacci( n:Int64 ) -> Int64 {
    if n < 2 {
        return n;
    }else {
        return fibonacci(n:n-1) + fibonacci(n:n-2)
    }
}

let f:Int64 = 44
print("fibonacci(\(f)) = \(fibonacci(n: f))")

// Ici on respecte les paradigmes de la PF
DispatchQueue.global().async {
    let r:Int64 = fibonacci(n: f)
    DispatchQueue.main.async {
        print(r)
    }
}

DispatchQueue.global().async {
    let r:Int64 = fibonacci(n: f)
    DispatchQueue.main.async {
        print(r)
    }
}

DispatchQueue.global().async {
    let r:Int64 = fibonacci(n: f)
    DispatchQueue.main.async {
        print(r)
    }
}

DispatchQueue.global().async {
    let r:Int64 = fibonacci(n: f)
    DispatchQueue.main.async {
        print(r)
    }
}

print("wait main thread")
Thread.sleep(forTimeInterval: 20.0)
print("fin")










