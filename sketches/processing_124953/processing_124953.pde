
int monsterX;
int monsterY;

void setup() {
  size(200, 200);
  background(255);
  monsterY = 100;
}

void draw() {
  background(255);      //kleur van het document//
  monsterX = mouseX;
  monsterY= monsterY-1;
  rectMode(CENTER);
  stroke(0);
  fill(0,180,0);
  /*lichaampje*/
  fill(186,182,182);    //kleur van het lichaampje//
  rectMode(CENTER);     //positionering van het vormpje van het lichaampje//
  rect(monsterX,monsterY,20,100); //vorm van het lichaampje//

  fill(0);              //zwarte sjlieps//
  rect(monsterX,monsterY,5,40);

  fill(186,0,10);        //rode sjlieps//
  rect(monsterX,monsterY,3,35);

  /*broekje*/
  fill(186,0,10);
  rectMode(CENTER);
  rect(monsterX,monsterY+45,20,10);

  /*hoofd*/
  fill(186,182,182);
  rect(monsterX,monsterY-30,60,60);


  /*linker oog*/
  fill(255);
  ellipse(monsterX-19,monsterY-30,16,31);

  /*linker iris*/
  fill(186,0,10);
  ellipse(monsterX-19,monsterY-30,8,15);  


  /*rechter oog*/
  fill(255);
  ellipse(monsterX+19,monsterY-30,16,32);

  /*rechter iris*/
  fill(186,0,10);
  ellipse(monsterX+19,monsterY-30,8,14);

  /*beentjes*/
  line(monsterX-10,monsterY+50,monsterX-20,monsterY+60);
  line(monsterX+10,monsterY+50,monsterX+20,monsterY+60);
  
  ellipse(monsterX-21,monsterY+55,8,14);
  ellipse(monsterX+19,monsterY+55,8,14);
  
  /*armpjes*/
  line(monsterX-10,monsterY+5,monsterX-20,monsterY+30);
  line(monsterX+10,monsterY+5,monsterX+20,monsterY+30);
  
  rect(monsterX,monsterY-63,40,7);
  fill(0);
  rect(monsterX,monsterY-70,30,14);
  
//herhalen
if(monsterY==-80) {
  monsterY=300;
  }
}

