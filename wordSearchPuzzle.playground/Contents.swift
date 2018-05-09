/* === === SOUCIS MAJEUR === ===

L'utilisation d'un dictionary de type [Int:Int] pour letterPosition
pose soucis : quand il y a plusieurs lettres identiques dans une même
ligne, seule la dernière est enregistrée.
Il faudrait partir sur un Array contenant un dictionary unique de
type [[Int:Int]]. A tester.

=== === === === === === === ===*/

// implémentation de la grille de lettres
//                                      0   1   2   3   4   5   6   7   8
let gridSearchWords: [[Character]] = [["R","E","I","F","I","T","R","O","M"],
                                      ["E","E","C","N","E","G","E","R","A"], // 1:8
                                      ["S","G","I","N","H","A","L","E","I"], // 2:5
                                      ["S","A","O","S","C","E","N","E","T"], // 3:1
                                      ["E","L","V","O","O","A","O","E","R"], // 4:5
                                      ["R","U","E","U","L","B","R","T","I"],
                                      ["T","O","I","R","L","R","M","R","S"],
                                      ["I","R","T","C","I","I","A","A","E"], // 7:6 + 7:7
                                      ["A","E","A","I","A","C","L","N","J"], // 8:0 + 8:2 + 8:4
                                      ["M","D","B","L","M","O","I","G","O"],
                                      ["P","I","O","L","E","T","S","E","U"],
                                      ["E","V","R","E","N","E","E","R","R"],
                                      ["R","E","C","N","E","E","L","E","P"],
                                      ["E","D","A","T","R","A","C","N","I"]] // 13:2 + 13:5
                                                                             // A est trouvé 11 fois

var convertedWord = [Character]()
var whichLetter: Character
var letterPosition: [Int:Int] = [:]

// Cette fonction convertit un String vers un Array de type Character
func convertAWordToArray(word: String) {
  for car in word {
    convertedWord.append(car)
  }
}

/* Cette fonction recherche une lettre dans gridSearchWords et renvoie
les coordonnées de chaque résultat dans un dictionnaire letterPosition [x:y]*/

func  searchInTheGrid (whichLetter: Character) {
  var  howManyLetters = 0
  var  col  =   0
  letterPosition = [:]
  
  for  (line, value)  in  gridSearchWords.enumerated()  {
    let  searchInLine  =  value
    col = 0
    for  letter: Character  in  searchInLine  {
      print("Position explorée : \(line, col)")
      if  letter == whichLetter   {
        print("letterPosition avant: \(letterPosition).")
        howManyLetters  +=   1
        letterPosition[line] = col
        print("Le \(howManyLetters)° A s'ajoute à letterPosition qui contient alors \(letterPosition.count) positions.")
        print("On ajoute les données à letterPosition : \(whichLetter, line, col).")
        print("letterPosition après : \(letterPosition).")
        col += 1
        
      }   else   {
        col  +=   1
      }
    }
  }
  if  howManyLetters  ==   0   {
    print ( " \( whichLetter )  n'est pas présente dans la grille." )
  }
  print("\(whichLetter) a été trouvé \(howManyLetters) fois.")
  print(letterPosition)
}

/*
 Cette fonction converti une chaîne de caractères en tableau de type Character.
 Elle permettra de rentrer manuellement chaque ligne de la grille du jeu par l'utilisateur.
 Cette fonctione sera à mettre en place lorsque la version via le Terminal sera en cours.
 */

var grid = [[Character]]()
var lineAsAnArray = [Character]()
var howManyLines = 2

func convertALineToArray(line: String) {
  for index in 0...(howManyLines - 1) {
    lineAsAnArray = []
    for character in line {
      lineAsAnArray.append(character)
    }
    print(lineAsAnArray)
    grid.insert(lineAsAnArray, at: index)
  }
}

// Cette fonction renvoie la lettre correspondant à des coordonnées row col
func lookForIt(roW: Int, coL: Int) -> Character {
  var line = gridSearchWords[roW]
  let letter = line[coL]
  return letter
}


  

  


// Lancement

convertAWordToArray(word: "AMENER")
print("On recherche la lettre \(convertedWord[0]).")
searchInTheGrid(whichLetter: convertedWord[0])
// convertALineToArray(line: "AZERTYUIOP")

// contrôle la position initiale de la recherche pour ne pas créer de bug de type Out of Range

for (row, col) in letterPosition {
  
  var line = gridSearchWords[row]
  let letter = line[col]
  print(letter, row, col)
  
  let gridLineCount = gridSearchWords[0].count - 1
  
  if row == 0 && col == 0 { // pas de Nord et pas d' Ouest
    let sud = lookForIt(roW: (row + 1), coL: (col))
    let est = lookForIt(roW: (row), coL: (col + 1))
    let sudEst = lookForIt(roW: (row + 1), coL: (col + 1))
    
  } else if row == (gridSearchWords.count - 1) && col == 0 { // pas de Sud et pas d' Ouest
    let nord = lookForIt(roW: (row - 1), coL: (col))
    let est = lookForIt(roW: (row), coL: (col + 1))
    let nordEst = lookForIt(roW: (row - 1), coL: (col + 1))
    
  } else if row == 0 && col == gridLineCount { // pas de Nord et pas d' Est
    let sud = lookForIt(roW: (row + 1), coL: (col))
    let ouest = lookForIt(roW: (row), coL: (col - 1))
    let sudOuest = lookForIt(roW: (row + 1), coL: (col - 1))
    
  } else if row == (gridSearchWords.count - 1) && col == gridLineCount { // pas de Sud et pas d' Est
    let nord = lookForIt(roW: (row - 1), coL: (col))
    let ouest = lookForIt(roW: (row), coL: (col - 1))
    let nordOuest = lookForIt(roW: (row - 1), coL: (col - 1))
    
  } else if row == 0 { // pas de Nord
    let sud = lookForIt(roW: (row + 1), coL: (col))
    let est = lookForIt(roW: (row), coL: (col + 1))
    let ouest = lookForIt(roW: (row), coL: (col - 1))
    let sudEst = lookForIt(roW: (row + 1), coL: (col + 1))
    let sudOuest = lookForIt(roW: (row + 1), coL: (col - 1))
    
  } else if row == (gridSearchWords.count - 1) { // pas de Sud
    let nord = lookForIt(roW: (row - 1), coL: (col))
    let est = lookForIt(roW: (row), coL: (col + 1))
    let ouest = lookForIt(roW: (row), coL: (col - 1))
    let nordEst = lookForIt(roW: (row - 1), coL: (col + 1))
    let nordOuest = lookForIt(roW: (row - 1), coL: (col - 1))
    
  } else if col == 0 { // pas d' Ouest
    let nord = lookForIt(roW: (row - 1), coL: (col))
    let sud = lookForIt(roW: (row + 1), coL: (col))
    let est = lookForIt(roW: (row), coL: (col + 1))
    let nordEst = lookForIt(roW: (row - 1), coL: (col + 1))
    
  } else if col == (convertedWord.count - 1) { // pas d' Est
    let nord = lookForIt(roW: (row - 1), coL: (col))
    let sud = lookForIt(roW: (row + 1), coL: (col))
    let ouest = lookForIt(roW: (row), coL: (col - 1))
    let nordOuest = lookForIt(roW: (row - 1), coL: (col - 1))
    let sudOuest = lookForIt(roW: (row + 1), coL: (col - 1))
  }
}
