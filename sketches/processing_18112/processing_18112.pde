
size(250, 250);

size(250, 250);
background(255);

smooth();

//noStroke();
//for(int y = 0; y <= height; y +=30){
  //for(int x = 0; x <= width; x +=60){
    //fill(#F6FF03, 70);
    //ellipse(x, y, 40, 40);
  //}
//}

//blue green gradient
//right wave- cross hatch
for(int i = 0; i < 300; i +=6)
  {stroke(5, i, 286);
  line(i, i, i + 180/2, 100);}

//first layer
for(int i = 70; i < 300; i +=6)
  {stroke(5, i, 170);
  line(i, i, i + 180/2, 100);}

//second layer
for(int i = 70; i < 300; i +=6)
  {stroke(5, i, 170);
  line(i, i, i + 130/2, 100);}

//third layer
for(int i = 70; i < 300; i +=6)
  {stroke(5, i, 170);
  line(i, i, i + 90/2, 100);}


//left vertical wave
//light blue, under layer
for(int i = 0; i <= 250; i += 4)
  {stroke(41, 255, 210);
  line(i, i, i*2.5, 300);}

//first layer
for(int i = 0; i <= 250; i += 4)
  {stroke(5, i, 179);
  line(i, i, i*2, 300);}

//second layer
for(int i = 0; i <= 250; i += 4)
  {stroke(5, i, 179);
  line(i, i, i*3, 300);}

//noStroke();
//for(int y = 0; y <= height; y +=10){
  //for(int x = 0; x <= width; x +=10){
    //fill(#F6FF03, 40);
    //rectMode(CENTER);
  //}
//}



