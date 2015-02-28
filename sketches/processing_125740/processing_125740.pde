

/* Nome: Thiago Fabiano Borges Zanini
Data: 18/12/13 */

/* Foi difícil escolher entre tantos momentos nesse ano, então fiz o primeiro que me veio a mente, que foi a utfpr, representei também a neve, porque "nevou" em curitiba */
float y = 0.0;

void setup () {
  size (300, 300); 
  
}


void draw () {
  background (#B7E4F5);
  fill(#FFFFFF);
  strokeWeight(0);
  for (int x = 15; x <= 250; x += 10){
 ellipse(x, y, 5, 5);
 ellipse(x+15, y+20, 5, 5);
 ellipse(x, y+40, 5, 5);
 ellipse(x+15, y+60, 5, 5);
   if (y > 40) {
    x+=20;
  }
   if (y > 90) {
    x+=30;
  }
  
  }
  
  
 
  y+= 0.5;
  if (y > 150) {
    y = -50.0;
  }
  
   stroke(#FFFFFF);
fill(#989898);
rect(0,220,300,100);
  
   textSize(32);
  fill(#050505);
  text("UT", 10, 250);
    fill(#FCDE2B);
  text("F", 45, 255);
   fill(#050505);
    textSize(24);
  text("PR", 60, 250);
 
   fill(#FFFCFC);
   
    //nuvem1
    ellipse(45,10,100,25);
    ellipse(38,5,45,20);
    ellipse(54,5,45,20);
    ellipse(40,20,60,20);
     //nuvem2
    ellipse(95,10,100,25);
    ellipse(88,5,45,20);
    ellipse(104,5,45,20);
    ellipse(90,20,60,20);     
     //nuvem3
    ellipse(175,0,120,20);
    ellipse(161,3,50,20);
    ellipse(197,3,40,20);
    ellipse(175,10,60,20);
    //nuvem4
    ellipse(230,10,100,25);
    ellipse(220,5,45,20);
    ellipse(250,5,45,20);
    ellipse(230,20,60,20);
    fill(#797171);
    rect(10,260,100,30);
    rect(150,260,100,30);

   
}
