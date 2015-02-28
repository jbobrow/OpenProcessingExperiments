
size(400,400);
background(255);
noStroke(); // turn off outline
colorMode(HSB,255,50,100);

fill(150,255,150);
//loop with i going from 0 to height of window by 15 each time
for (int i = 0; i < height; i += 30){
 //loop with j going from 0 to width of window each time
 //complete j loop is executed every time i loop executes once
 for (int j = 0; j < width; j +=30){
   // draw rectange at i, j co-ordinates
   ellipse(j, i, 25,25);
 }
}

fill(255,255,150);
for (int i = 0; i < height; i += 30){
 //loop with j going from 0 to width of window each time
 //complete j loop is executed every time i loop executes once
 for (int j = 0; j < width; j +=60){
   // draw rectange at i, j co-ordinates
   ellipse(j, i, 25,25);
 }
}

fill(80,255,150);
for (int i = 0; i < height; i += 30){
 //loop with j going from 0 to width of window each time
 //complete j loop is executed every time i loop executes once
 for (int j = 0; j < width; j +=90){
   // draw rectange at i, j co-ordinates
   ellipse(j, i, 25,25);
 }
}

fill(40,255,150);
for (int i = 0; i < height; i += 30){
 //loop with j going from 0 to width of window each time
 //complete j loop is executed every time i loop executes once
 for (int j = 0; j < width; j +=120){
   // draw rectange at i, j co-ordinates
   ellipse(j, i, 25,25);
 }
}

