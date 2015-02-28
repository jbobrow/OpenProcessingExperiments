
int arr[] = {
  6, 3, 12, 6, 4, 6, -1, 10, 3, 4, 4, 4, 4, 0, 3, 0, 5, 3, 5, 10, 4, 0, 1, 8, 3, 6, 4, 3, 9, 3, 5, 3, 2, 10, 7, 1, 2, 6, 8, 8, 11, 5, 11, 2, 3
};
int arr2[] = {
  0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1
};

int w = 40;
int h = 12;

int rx = 50;
int ry = h;

int rx2 = rx+400;
int ry2 = ry;


int rx3 = rx+800;
int ry3 = ry;

int w_legend =width+500;


int rx4 = rx+200;
int ry4 = ry;


int blck = rx;
int bleu = rx;

int blck2 = rx2;
int bleu2 = rx2;

int prpl3 = rx3;
int blck3 = rx3;
int bleu3 = rx3;


int keyIndex = 1;

color white = color(255);
color black = color(180, 180, 180);

color blue = color(0, 0, 255);
color green = color(0, 255, 0);
color purple = color(150, 0, 150);
color red = color(255, 0, 0);


void setup() {
  size (800, 600);
}

void draw() {
  smooth();
  background(160, 160, 160);

  draw_graph();
  draw_legend();
  draw_ends();
}


void draw_legend() {
  fill(255, 0, 0);
  textSize(14);
  text("6 or less", w_legend-100, ry+10);
  fill(green);
  rect(w_legend, ry, w, h);

  fill(255, 0, 0);
  textSize(14);
  text("more than 6", w_legend-100, ry+45);
  fill(blue);
  rect(w_legend, ry+30, w, h);

  fill(255, 0, 0);
  textSize(14);
  text("less than 1", w_legend-100, ry+75);
  fill(white);
  rect(w_legend, ry+60, w, h);
/*
  fill(255, 0, 0);
  textSize(14);
  text("exactly 6", w_legend-100, ry+105);
  fill(purple);
  rect(w_legend, ry+90, w, h);
*/
  fill(255, 0, 0);
  textSize(14);
  text("Press \"a\"/\"s\" to move blue pieces, press \"z\"/\"x\" to move white pieces", w_legend-120, ry+100, 150, 150);
}


void draw_graph() {



  fill(255, 0, 0);
  textSize(14);
  text("Where 6 is included", rx+20, ry-10);

  for (int i = 0; i<45; i++) {

    if ((arr[i]<=6) && (arr[i]>1)) {
      fill(green);
      rect(rx+20, ry, w, h);
    }
    else if (arr[i]>6) {
      fill(blue);
      rect(bleu, ry, w, h);
    }

    else if (arr[i]<=1) {
      fill(white);
      rect(blck+40, ry, w, h);
    }
    fill(255, 0, 0);
    textSize(14);
    text(i+1, rx-20, ry+17);
    ry+=h;
  } 

  /*
     fill(255,0,0);
   textSize(14);
   text("Where 6 is NOT included", rx2+20, ry2-10);
   for (int i = 0; i<45; i++){
   if ((arr[i]<6) && (arr[i]>1)){
   fill(green);
   rect(rx2+20, ry2, w, h);
   }
   else if (arr[i]>=6){
   fill(blue);
   rect(bleu2, ry2, w, h);
   }
   
   else if (arr[i]<=1){
   fill(white);
   rect(blck2+40, ry2, w, h);
   }
   fill(255,0,0);
   textSize(14);
   text(i+1, rx2-20, ry2+17);
   ry2+=h;
   } 
   
   
   fill(255,0,0);
   textSize(14);
   text("Where 6 is SEPARATE", rx3+20, ry3-10);
   
   for (int i = 0; i<45; i++){
   if ((arr[i]<6) && (arr[i]>1)){
   fill(green);
   rect(rx3+20, ry3, w, h);
   }
   else if (arr[i]>6){
   fill(blue);
   rect(bleu3, ry3, w, h);
   }
   else if (arr[i]==6){
   fill(purple);
   rect(prpl3, ry3, w, h);
   }
   
   else if (arr[i]<=1){
   fill(white);
   rect(blck3+40, ry3, w, h);
   }
   fill(255,0,0);
   textSize(14);
   text(i+1, rx3-20, ry3+17);
   ry3+=h;
   } 
   */
  ry3 = 5;
  ry2 = 5;
  ry = 5;
}

void draw_ends() {

  for (int i = 0; i<45; i++) {

    if (arr2[i] == 1) {
      fill(red, 90);
      rect(rx4+20, ry4, w, h);
    }
    if (arr2[i] == 0) {
      fill(white, 90);
      rect(rx4+20, ry4, w, h);
    }
    ry4+=h;
  }

  ry4 = 5;
}




void keyPressed() {


  switch  (key) {
  case '1': 
    keyIndex = 1;
    println (keyIndex);

    break;

  case '2': 
    keyIndex = 2;
    println (keyIndex);

    break;

  case '3': 
    keyIndex = 3;
    println (keyIndex);

    break;
  }

  if (key == 'a') {
    if (keyIndex == 1) {
      blck-=5;
    }
    if (keyIndex == 2) {
      blck2-=5;
    }

    if (keyIndex == 3) {
      blck3-=5;
    }
  }
  if (key == 's') {
    if (keyIndex == 1) {
      blck+=5;
    }
    if (keyIndex == 2) {
      blck2+=5;
    }
    if (keyIndex == 3) {
      blck3+=5;
    }
  }
  if (key == 'z') {
    if (keyIndex == 1) {
      bleu-=5;
    }
    if (keyIndex == 2) {
      bleu2-=5;
    }
    if (keyIndex == 3) {
      bleu2-=3;
    }
  }
  if (key == 'x') {
    if (keyIndex == 1) {
      bleu+=5;
    }
    if (keyIndex == 2) {
      bleu2+=5;
    }
    if (keyIndex == 3) {
      bleu3+=5;
    }
  }


  if (key == 'q') {
    if (keyIndex == 3) {
      prpl3-=5;
    }
  }
  if (key == 'w') {
    if (keyIndex == 3) {
      prpl3+=5;
    }
  }
}

void mouseDragged() 
{
rx4 = mouseX;

}


