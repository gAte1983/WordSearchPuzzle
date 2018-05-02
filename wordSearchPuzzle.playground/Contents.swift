// implémentation de la grille de lettres
let gridSearchWords: [[Character]] =
  [["R","E","I","F","I","T","R","O","M"],
   ["E","E","C","N","E","G","E","R","A"],
   ["S","G","I","N","H","A","L","E","I"],
   ["S","A","O","S","C","E","N","E","T"],
   ["E","L","V","O","O","A","O","E","R"],
   ["R","U","E","U","L","B","R","T","I"],
   ["T","O","I","R","L","R","M","R","S"],
   ["I","R","T","C","I","I","A","A","E"],
   ["A","E","A","I","A","C","L","N","J"],
   ["M","D","B","L","M","O","I","G","O"],
   ["P","I","O","L","E","T","S","E","U"],
   ["E","V","R","E","N","E","E","R","R"],
   ["R","E","C","N","E","E","L","E","P"],
   ["E","D","A","T","R","A","C","N","I"]]

// lire une ligne
// on recherche la lettre
var convertedWord = [Character]()
var whichLetter: Character

// Cette fonction convertit un String vers un Array de type Character
func convertAWordToArray(word: String) {
  for car in word {
    convertedWord.append(car)
  }
}

// Cette fonction recherche une lettre dans gridSearchWords et renvoie les coordonnées de chaque résultat dans un dictionnaire letterPosition [x:y]
func  searchInTheGrid (whichLetter: Character) {
  var  howManyLetters = 0
  var  row  =   0
  var  letterPosition: [Int:Int] = [:]
  for  (line, value)  in  gridSearchWords.enumerated()  {
    let  searchInLine  =  value
    row = 0
    for  letter: Character  in  searchInLine  {
      if  letter == whichLetter   {
        print(line, row)
        letterPosition[line] = row
        print(letterPosition)
        howManyLetters  +=   1
      }   else   {
        row  +=   1
      }
    }
  }
  if  howManyLetters  ==   0   {
    print ( " \( whichLetter )  n'est pas présente dans la grille." )
  }
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

convertAWordToArray(word: "LEVITATION")
searchInTheGrid(whichLetter: convertedWord[0])

convertALineToArray(line: "AZERTYUIOP")
