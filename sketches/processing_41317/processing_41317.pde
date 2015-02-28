
PFont fontA;
PShape xmark;
PShape logo;
float val;

void setup() {
  size(500, 500);
  background(255);
  fill(255);
  smooth();
  // Uncomment the following two lines to see the available fonts 
//  String[] fontList = PFont.list();
//  println(fontList);
//  textMode(SHAPE);
  shapeMode(CENTER);
  xmark = loadShape("x.svg");
  logo = loadShape("logo1.svg");
  fontA = loadFont("Uni-Sans-Heavy-48.vlw");
//  myFont = createFont("Uni-Sans-Heavy", 72);
  textFont(fontA, 48);
//  text("PA", width/2-40, height/2+20);
}

int n = 0;
void draw()
{
  
  char letter;
  int counter;
  int margin = 0;
  
  fill(255);
  rectMode(CORNERS);
  rect(0,0,500, 500);
  



for(int row = 1; row < 11; row++) {
  for(int column = 1; column < 20; column++) {
  
    counter = (int) random(26);
    
    fill(0);
shape(logo, width/2-200, height/2-75, 400, 130);
  
//mousePressed
if(mousePressed == true)
{
  
  shape(xmark, width/2, height/2, 150, 150);
  noStroke();
  
 if (counter == 1) { 
        letter = '@';
        text(letter, margin + (width - 2 * margin)*column/20, margin + (height - 15*margin)*row/11);
        fill(counter+100, 0, 0);
        ellipse((width - 2*margin)*column/20, (height - 15*margin)*row/11, counter, counter);
      }
  if (counter == 2) { 
        letter = '$';
        text(letter, margin + (width - 2 * margin)*column/20, margin + (height - 15*margin)*row/11);
        fill(#E23423);
        ellipse((width - 2*margin)*column/20, (height - 15*margin)*row/11, counter, counter);
      } 
   if (counter == 3) { 
        letter = '%';
        text(letter, margin + (width - 2 * margin)*column/20, margin + (height - 15*margin)*row/11);
        fill(counter+100, 0, 0);
        ellipse((width - 2*margin)*column/20, (height - 15*margin)*row/11, counter, counter);
      }
  if (counter == 4) { 
        letter = '&';
        text(letter, margin + (width - 2 * margin)*column/20, margin + (height - 15*margin)*row/11);
        fill(counter+100, 0, 100);
        ellipse((width - 2*margin)*column/20, (height - 15*margin)*row/11, counter, counter);
      }  
   if (counter == 5) { 
        letter = '’';
        text(letter, margin + (width - 2 * margin)*column/20, margin + (height - 15*margin)*row/11);
        fill(counter+50, 0, counter-100);
        ellipse((width - 2*margin)*column/20, (height - 15*margin)*row/11, counter, counter);
      }
  if (counter == 6) { 
        letter = '(';
        text(letter, margin + (width - 2 * margin)*column/20, margin + (height - 15*margin)*row/11);
        fill(counter+10, 0, counter-50);
        ellipse((width - 2*margin)*column/20, (height - 15*margin)*row/11, counter, counter);
      }  
   if (counter == 7) { 
        letter = '*';
        text(letter, margin + (width - 2 * margin)*column/20, margin + (height - 15*margin)*row/11);
        fill(counter+50, 0, 0);
        ellipse((width - 2*margin)*column/20, (height - 15*margin)*row/11, counter, counter);
      }
  if (counter == 8) { 
        letter = '+';
        text(letter, margin + (width - 2 * margin)*column/20, margin + (height - 15*margin)*row/11);
        fill(0, counter+100, 0);
        ellipse((width - 2*margin)*column/20, (height - 15*margin)*row/11, counter, counter);
      }  
   if (counter == 9) { 
        letter = '?';
        text(letter, margin + (width - 2 * margin)*column/20, margin + (height - 15*margin)*row/11);
        fill(counter+100, 0, counter-100);
        ellipse((width - 2*margin)*column/20, (height - 15*margin)*row/11, counter, counter);
      }
  if (counter == 10) { 
        letter = 'Ø';
        text(letter, margin + (width - 2 * margin)*column/20, margin + (height - 15*margin)*row/11);
        fill(counter-100, counter+100, 0);
        ellipse((width - 2*margin)*column/20, (height - 15*margin)*row/11, counter, counter);
      }      
      
  }
  else
  {
//    letter = 'P';
//    text(letter, width/2-40, height/2+20);
//    letter = 'O';
//    text(letter, width/2-10, height/2+20);
//    letter = 'S';
//    text(letter, width/2+20, height/2+20);
//    letter = 'T';
//    text(letter, width/2+50, height/2+20);
//    letter = 'A';
//    text(letter, width/2-40, height/2+60);
//    letter = 'N';
//    text(letter, width/2-10, height/2+60);
//    letter = 'A';
//    text(letter, width/2+20, height/2+60);
//    letter = 'L';
//    text(letter, width/2+50, height/2+60);
//    letter = 'O';
//    text(letter, width/2+80, height/2+60);
//    letter = 'G';
//    text(letter, width/2+110, height/2+60);
  }
}

}
}

