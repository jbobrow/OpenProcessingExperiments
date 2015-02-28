
Halo thisHalo;
Head thisHead;

void setup() {
  size(700, 700);
  smooth();
  thisHalo=new Halo (85,20,300,10,90,90,250,250);
  thisHead=new Head(350,350,90,90);
}

void draw() {
  background(255);
   thisHead.displayHead();
   thisHead.face();

   thisHalo.rotateHalo();

//  println(mouseX);
//  println(mouseY);


}


