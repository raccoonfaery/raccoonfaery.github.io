PFont buffied;
String[] freq;
color[] colors = {color(255,0,0, 100), color(255,0,0), color(211,211,211), color(139, 0, 0, 200)}; //red alpha, red, gray
ArrayList<String> freqSet = new ArrayList<String>();
ArrayList<Integer> freqFreq = new ArrayList<Integer>();

// Set up the size of the image, load font and frequency txt. 
void setup() {
   size(700, 700);
   buffied = createFont("buffied.TTF", 18);
   freq = loadStrings("wordfrequency.txt");
   background(200);
   noLoop();
}

// Set the font and size of text and bounds of the diameter.
void draw() {
   textFont(buffied, 18);
   textAlign(RIGHT);
   for (String f : freq) {
      if (freqSet.contains(f)) {
         int i = freqSet.indexOf(f);
         freqFreq.set(i, freqFreq.get(i) + 1);
      }
      else {
         freqSet.add(f);
         freqFreq.add(1);  // Initiate count for the frequency.
      }
   }
   //println(freqSet);
   //println(freqFreq);
   for (String f : freqSet) {
      fill(colors[0]);
      stroke(colors[1]);
      int i = freqSet.indexOf(f);
      int dia = freqFreq.get(i) / 2;
      dia = constrain(abs(dia), 1, 600); // constrain diameter
      int x = int(random(650 - dia) + dia / 2 + 25); // so doesn't go over edge
      int y = int(random(650 - dia) + dia / 2 + 25); // so doesn't go over edge
      if (dia <= 300) {
          fill(colors[3]);
          stroke(colors[1]);
      }
      circle(x, y, dia);
      fill(0);
      int txtsz = dia / 2;
      txtsz = constrain(abs(txtsz), 18, 200); // restrict the size of the text size
      textSize(txtsz);
      text(f, x, y);
   }
}
