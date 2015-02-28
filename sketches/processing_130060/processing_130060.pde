
//Change the rotating flower
//Press '1': change the type of flower(Y, H, I, V type).
//Press '2': decrease the speed of rotating.
//Press '3': increase the speed of rotating.
//Press '4': change the dark-and-light value of background.

//Stella Wang, Tainan, 2014/01/15
/* learn from "Rotation Recurtion Tree for_yvonne 51", ArtBotHack
 original Daniel Shiffman. */


int v1;
int a = 1;
float g = 1;
int b = 10;
int z;

float h = 0;
float theta = random(100);

void setup() {
  size(600, 600);
  background(100);
}

void draw() {
  background(30*g);
  println(v1);

  //change branch(type of flower)
  if ( v1 == 1 ) {    
    if (a > 5) {
      a=0;
    }
    a++;
  } 

  //speed --
  if ( v1 == 2 ) {    
    b--;
    if (b < -10) {
      b++;
    }
  } 

  //speed ++    
  if ( v1 == 3 ) {    
    b++;
    if (b > 30) {
      b--;
    }
  }

  //change background color
  if ( v1 == 4 ) {    
    g = random(g);
    g++;
    if (g > 8) {
      g=1;
    }
  }


  //branch setting    
  translate(width/2, height/2);
  stroke(250, 100);
  theta=theta+0.003*b;///(2*pi)
  branch(100);
  rotate(PI/6*a);  //divided circle
  branch(130);
  rotate(PI/6*a);
  branch(50+20);
  rotate(PI/6*a);
  branch(130);
  rotate(PI/6*a);
  v1 = 0;
}

void branch(float h) {
  h *= 0.8*noise(100*a);        //Y branch number
  for (int k=1; k<2; k++) {  //branch level
    if (h > 7) {
      pushMatrix();
      rotate(theta);
      line(0, 0, 0, -h);
      translate(0, -h);
      branch(h);
      popMatrix();
      pushMatrix();   
      rotate(theta);  
      line(0, 0, 0, -h); 
      translate(0, -h);
      branch(h);    
      popMatrix();
      pushMatrix();
      rotate(-theta);
      line(0, 0, 0, -h);
      translate(0, -h);
      branch(h);     
      translate(0, -h);
      popMatrix();
    }
  }
}




void keyPressed() {
  if (key == '1') {
    v1 = 1;
  }
  if (key == '2') {
    v1 = 2;
  }
  if (key == '3') {
    v1 = 3;
  }
  if (key == '4') {
    v1 = 4;
  }
}



