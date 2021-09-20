String[] words;
PFont buffied;
Boolean finished = false;
int lineNumber = 1;
int textHeight = 22;
int margin = 3;
int currentX = margin;
int currentY = textHeight * lineNumber + margin;
int[] usedIndexes;
color[] textColors = {color(255,0,0), color(129,9,9), color(211,211,211)}; //red, maroon, gray

void setup() {
  size(700,600);
  buffied = createFont("buffied.TTF",200);
  words = loadStrings("uniquewords.txt");
}

void draw() {
  background(0);
  textFont(buffied, 30); // buffied font at size 30
  textLeading(textHeight);
  while (finished == false) {
    addToScreen();
  }
  noLoop(); // only happens once
}

// function to retieve and delete random word from array of unique words
String getRandomWord() {
  
  //retrieve random word
  int randomWordIdx = Math.round(random(words.length - 1));
  String randomWord = words[randomWordIdx];

  //return stored random word
  return(randomWord);
}

//function to add words to screen
void addToScreen(){
  //generate random word
  String nextWord = getRandomWord();
 
 //check if the word is longer than the space remaining in current line
 //if so move to next line
  if (currentX + textWidth(nextWord) + (margin * 2) > width) {
    currentY = currentY + textHeight + margin ;
    currentX = margin;
    lineNumber = lineNumber + 1 ;
  }
  
  //if reached end of frame, set finished to true and stop generating words
  if (lineNumber * textHeight + lineNumber * (margin * 1.2) > height){
    finished = true;
    return;
  } 
  
  //pick random color from textColors array 
  int randomColorIdx = Math.round(random(0,2));
  fill(textColors[randomColorIdx]);
  
  //add text to current x,y position on screen
  text(nextWord, currentX+margin, currentY);
  currentX = currentX + Math.round(textWidth(nextWord))+ margin*3; //move x position to after last word
  
  
}
