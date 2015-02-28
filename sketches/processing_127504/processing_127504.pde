
int monsterX;
int monsterY;

int richting;
int teller;

boolean verandering;

void setup () {
  
  size (300,300); 
  monsterX = 100;
  monsterY = 100;
  richting = 3;
  teller = 0;
  verandering = true;
}

void draw () {
  
  background (255,255,255);
  
  if (verandering == true){
      fill (89,180,23); }

  if (verandering == false){
     fill (255,71,92); }
     
     monsterY = monsterY + richting;
  
  if (monsterY > 300 || monsterY <0){
     richting = - richting;
     teller = teller + 1;  }
     
  if (teller == 10){
    teller = 0;
    verandering = ! verandering;  }
  
//haar zwart */  
noStroke ();
fill (0);
ellipse (monsterX-69,monsterY-88,180,210);

noStroke ();
fill (255,255,255);
rect (monsterX-70,monsterY+45,200,200);

//benen zwart */
noStroke ();
fill (0);
rect (monsterX+3,monsterY+100,35,40);

noStroke ();
fill (0);
ellipse (monsterX+3,monsterY+132,18,18);

noStroke ();
fill (0);
ellipse (monsterX+20,monsterY+132,18,18);

//benen wit */
noStroke ();
fill (250,250,250);
rect (monsterX+6,monsterY+100,29,36);

noStroke ();
fill (250,250,250);
ellipse (monsterX+6,monsterY+128,13,13);

noStroke ();
fill (250,250,250);
ellipse (monsterX+22,monsterY+128,13,13);

noStroke ();
fill (0);
rect (monsterX+6,monsterY+135,29,2);

noStroke ();
fill (0);
rect (monsterX+19,monsterY+100,4,36);

//jurk */
stroke (0);
  if (verandering == true){
      fill (89,180,23); }

  if (verandering == false){
     fill (255,71,92); }
rect (monsterX,monsterY+30,40,70);

noStroke ();
fill (0);
rect (monsterX,monsterY+55,40,20);

// armen */
stroke (0);
strokeWeight (3);
fill (253,209,190);
ellipse (monsterX-5,monsterY+40,10,55);

stroke (0);
fill (253,209,190);
ellipse (monsterX+35,monsterY+40,10,55);

//Hoofd */
stroke (0);
fill (253,209,190);
ellipseMode(CORNER);
ellipse (monsterX-48,monsterY-71,136,120);

// haar ponny */
noStroke ();
fill (0);
ellipse (monsterX-49,monsterY-72,139,100);

noStroke ();
fill (253,209,190);
rect (monsterX-30,monsterY-22,99,50);

//Mond */
noFill();
stroke(0);
ellipse (monsterX+7,monsterY,25,40);

noStroke ();
fill (253,209,190);
rect (monsterX,monsterY-16,35,40);

//oog wit */
stroke (0);
fill (255,255,255);
ellipse (monsterX-45,monsterY-33,60,60);

stroke (0);
fill (255,255,255);
ellipse (monsterX+25,monsterY-33,60,60);

//oog groen */
noStroke ();
  if (verandering == true){
      fill (89,180,23); }

  if (verandering == false){
     fill (255,71,92); }
ellipse (monsterX-38,monsterY-29,53,53);

noStroke ();
  if (verandering == true){
      fill (89,180,23); }

  if (verandering == false){
     fill (255,71,92); }
ellipse (monsterX+26,monsterY-29,53,53);


//oog zwart */
noStroke ();
fill (0);
ellipse (monsterX-26,monsterY-22,40,40);

noStroke ();
fill (0);
ellipse (monsterX+27,monsterY-22,40,40);

//oog wit */
noStroke ();
fill (255,255,255);
ellipse (monsterX-12,monsterY-10,17,17);

noStroke ();
fill (255,255,255);
ellipse (monsterX+35,monsterY-10,17,17);

noStroke ();
fill (0);
rect (monsterX-40,monsterY-33,120,12);

//driekhoek ponny */
noStroke ();
fill (253,209,190);
triangle(monsterX+30,monsterY-20,monsterX+20,monsterY-55,monsterX+15,monsterY-20);

println(teller);


}

