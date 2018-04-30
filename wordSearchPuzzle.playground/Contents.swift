// implémentation de la grille de lettres
let gridSearchWords: [Character] =
  [   ["R","E","I","F","I","T","R","O","M"],
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

func convertAWordToArray(word: String) {
  for car in word {
    convertedWord.append(car)
  }
}

func  searchInTheGrid (whichLetter: Character) {
  var  howManyLetters = 0
  var  position  =   0
  var  x: [Int] = []
  var y: [Int] = []
  for  (index, value)  in  gridSearchWords.enumerated()  {
    var  searchInLine  =  value
    position = 0
    for  letter: Character  in  searchInLine  {
      if  letter == whichLetter   {
        print(index, position)
        x.append(position)
        y.append(index)
        print(y, x)
        var instantX = x.last
        var instantY = y.last
        // print("Position \(howManyLetters) : Ligne \(instantY):Colonne \(instantX)")
        howManyLetters  +=   1
      }   else   {
        position  +=   1
      }
    }
  }
  if  howManyLetters  ==   0   {
    print ( " \( whichLetter )  n'est pas présente dans la grille." )
  }
}

/* Cette fonction (à implémenter) converti une chaîne de caractère
en un tableau et l'incrémente dans grid (équiv gridSearchWords) */

var grid = [[Character]]()
var lineAsAnArray = [Character]()
var howManyLines = 2

func ConvertALineToAnArray(line: String) {
    for index in 0...howManyLines {
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
