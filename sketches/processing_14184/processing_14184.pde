
//Assignment 2 Programming for CreaTe
//Creature as a function (So the same rabbit like assignment 1)
//And for sure animated using the mouse
//published at http://www.openprocessing.org/visuals/checkVisual.php?visualID=14184

int x = mouseX;
int y= mouseY ;
//here you can change the windowsize
int s= 200;
//here you can change the rabbits bigness
int bigness = 200;
//the backgroundcolor
float c=255;
//you can also change the colors, if you want to
//dark grey and it`s stroke
float rabbitGrey= color ((int)180,(int)180,(int)180,(int)255);
float rabbitStroke= color ((int)150,(int)150,(int)150,(int)255);
//light grey and it`s stroke
float rabbitLgrey= color ((int)195,(int)195,(int)195,(int)255);
float rabbitLstroke= color ((int)180,(int)180,(int)180,(int)255);
//rabbit`s color for example pink
float rabbitColor= color ((int)255,(int)168,(int)220,(int)255);
float a= rabbitColor;
float rabbitCstroke= color ((int)240,(int)138,(int)199,(int)255);
float b= rabbitCstroke;
//if mouse pressed: rabbit`s color
float rabbitBcolor= color ((int)0,(int)74,(int)255,(int)255);
float rabbitBstroke= color ((int)17,(int)39,(int)93,(int)130);
//if key pressed: rabbit`s color
float rabbitRcolor= color ((int)255,(int)0,(int)0,(int)255);
float rabbitRstroke= color ((int)255,(int)0,(int)23,(int)130);

void setup () {
  
  size(s,s);
  smooth();
  
}

void draw(){
  draw_my_Rabbit();
}

void draw_my_Rabbit() {
  
  background(c);

  rabbitColor= a;
  rabbitCstroke= b;
  
if(mousePressed) {
   //blau 
   rabbitColor= rabbitBcolor;
   rabbitCstroke= rabbitBstroke;
}
  
if(keyPressed) {
  rabbitColor= rabbitRcolor;
  rabbitCstroke= rabbitRstroke;
} 

 //Hase Normal
 //Körper
     //außen
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        ellipse(mouseX,mouseY+bigness/5.2632,bigness/4,bigness/3.6363);
     //innen
        fill((int)rabbitLgrey);
        stroke((int)rabbitLstroke);
        ellipse(mouseX,mouseY+bigness/4.4444,bigness/6.6666,bigness/5.7123);
//Kopf       
  //ohren
      //grau
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        ellipse(mouseX-bigness/20,mouseY-bigness/5.7143,bigness/13.333,bigness/2.5);
        ellipse(mouseX+bigness/20,mouseY-bigness/5.7143,bigness/13.333,bigness/2.5);
      //rosa
        fill((int)rabbitColor);
        stroke((int)rabbitCstroke);
        ellipse(mouseX-bigness/20,mouseY-bigness/6.6667,bigness/25,bigness/5);
        ellipse(mouseX+bigness/20,mouseY-bigness/6.6667,bigness/25,bigness/5);
      //Grundriss-Kopf
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        ellipse(mouseX,mouseY,bigness/5,bigness/5);
  //Augen
      //weiß
        fill(255,255,255,255);
        stroke(240,240,240,255);
        ellipse(mouseX-bigness/25,mouseY-bigness/40,bigness/25,bigness/20);
        ellipse(mouseX+bigness/25,mouseY-bigness/40,bigness/25,bigness/20);
      //blau  
        fill(0,164,255,255);
        stroke(0,164,255,100);
        ellipse(mouseX-bigness/25,mouseY-bigness/40,bigness/50,bigness/50);
        ellipse(mouseX+bigness/25,mouseY-bigness/40,bigness/50,bigness/50);
  //Mund
      //umriss
       fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        ellipse(mouseX,mouseY+bigness/25,bigness/8,bigness/10);
      //Zunge 
        fill((int)rabbitCstroke);
        stroke((int)rabbitColor);
        ellipse(mouseX,mouseY+bigness/20,bigness/40,bigness/20);
      //Zähne
        fill(255);
        stroke(255);
        quad(mouseX+bigness/200,mouseY+bigness/20,mouseX+bigness/200,mouseY+bigness/12.5,mouseX+bigness/66.6667,mouseY+bigness/12.5,mouseX+bigness/66.6667,mouseY+bigness/20);
        quad(mouseX-bigness/200,mouseY+bigness/20,mouseX-bigness/200,mouseY+bigness/12.5,mouseX-bigness/66.6667,mouseY+bigness/12.5,mouseX-bigness/66.6667,mouseY+bigness/20);
      //Mundwinkel
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        arc(mouseX+bigness/28.5714,mouseY+bigness/33.3333,bigness/13.3333,bigness/13.3333, PI/2,PI);
        arc(mouseX-bigness/28.5714,mouseY+bigness/33.3333,bigness/13.3333,bigness/13.3333, 0,PI/2);
      //Schnurrhaare sehen doof aus
    //Nase
        fill(60,60,60,255);
        stroke(45,45,45,255);
        triangle(mouseX-bigness/66.6667,mouseY,mouseX+bigness/66.6667,mouseY,mouseX,mouseY+bigness/33.3333);      
  //Beine
    //links
      //grau
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        arc(mouseX-bigness/5.7143,mouseY+bigness/3.6363,bigness/3.3333,bigness/8,TWO_PI-PI/2, TWO_PI);
        arc(mouseX-bigness/7.6923,mouseY+bigness/3.6363,bigness/5,bigness/9.5238, 0, PI/2);
        arc(mouseX-bigness/8,mouseY+bigness/4.4444,bigness/3.3333,bigness/5, PI/2, PI);
        arc(mouseX-bigness/5.8824,mouseY+bigness/4.3478,bigness/4.878,bigness/33.3333, PI, TWO_PI-PI/2);
       //rosa 
        fill((int)rabbitColor);
        stroke((int)rabbitCstroke);
        arc(mouseX-bigness/8,mouseY+bigness/3.6363,bigness/6.6667,bigness/12.5,TWO_PI-PI/2, TWO_PI);
        arc(mouseX-bigness/10,mouseY+bigness/3.6363,bigness/10,bigness/25, 0, PI/2);
        arc(mouseX-bigness/10,mouseY+bigness/4,bigness/6.6667,bigness/11.1111, PI/2, PI);
        arc(mouseX-bigness/8,mouseY+bigness/4,bigness/10,bigness/33.3333, PI, TWO_PI-PI/2);
        ellipse(mouseX-bigness/4.3478,mouseY+bigness/4.1667,bigness/16.6667,bigness/33.3333);
        ellipse(mouseX-bigness/4.6512,mouseY+bigness/3.6363,bigness/25,bigness/50);
        ellipse(mouseX-bigness/5.5556,mouseY+bigness/3.3898,bigness/33.3333,bigness/50);
   //rechts
      //grau    
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);   
        arc(mouseX+bigness/5.8824,mouseY+bigness/4.3478,bigness/4.8780,bigness/33.3333,TWO_PI-PI/2, TWO_PI);
        arc(mouseX+bigness/8,mouseY+bigness/4.4444,bigness/3.3333,bigness/5, 0, PI/2);
        arc(mouseX+bigness/7.6923,mouseY+bigness/3.6363,bigness/4.8780,bigness/10, PI/2, PI);
        arc(mouseX+bigness/5.7143,mouseY+bigness/3.6363,bigness/3.3333,bigness/8, PI, TWO_PI-PI/2);
     //rosa   
        fill((int)rabbitColor);
        stroke((int)rabbitCstroke);
        arc(mouseX+bigness/8,mouseY+bigness/4,bigness/10,bigness/33.3333,TWO_PI-PI/2, TWO_PI);
        arc(mouseX+bigness/10,mouseY+bigness/4,bigness/6.6667,bigness/11.1111, 0, PI/2);
        arc(mouseX+bigness/10,mouseY+bigness/3.6363,bigness/10,bigness/25, PI/2, PI);
        arc(mouseX+bigness/8,mouseY+bigness/3.6363,bigness/6.6667,bigness/12.5, PI, TWO_PI-PI/2);
        ellipse(mouseX+bigness/4.3478,mouseY+bigness/4.1667,bigness/16.6667,bigness/33.3333);
        ellipse(mouseX+bigness/4.6512,mouseY+bigness/3.6363,bigness/25,bigness/50);
        ellipse(mouseX+bigness/5.5556,mouseY+bigness/3.3898,bigness/33.3333,bigness/50);
//Arme
    //links
      //d.grau 
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);   
        ellipse(mouseX-bigness/10,mouseY+bigness/6.0606,bigness/13.3333,bigness/10);
      //h.grau  
        fill((int)rabbitLgrey);
        stroke((int)rabbitLstroke);
        ellipse(mouseX-bigness/11.7647,mouseY+bigness/6.0606,bigness/33.3333,bigness/13.3333);
   //rechts//  
      //d.grau
       fill((int)rabbitGrey);
        stroke((int)rabbitStroke);   
        ellipse(mouseX+bigness/10,mouseY+bigness/6.0606,bigness/13.3333,bigness/10);
      //h.grau  
        fill((int)rabbitLgrey);
        stroke((int)rabbitLstroke); 
       ellipse(mouseX+bigness/11.7647,mouseY+bigness/6.0606,bigness/33.3333,bigness/13.3333);
} 
 

