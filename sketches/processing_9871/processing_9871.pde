

/*
size(400,400);

background(255);
smooth();

shape(loadShape("Unbenannt-2.svg"), 70, 80);

*/

/*svg unkomprimiert in illustrator spechern
scg 1.0
convert to outline -> falls mit schriften geabreitet wird
images funktionieren nicht 

*/

PShape shp_1;
PShape shp_2;
PShape shp_3;
PShape shp_4;
PShape shp_5;
PShape shp_6;
PShape shp_7;
PShape shp_8;
PShape shp_9;
PShape shp_10;


void setup()
{
 size(300,300);

shapeMode(CENTER);
smooth();

shp_1 = loadShape("kopf.svg");
shp_2 = loadShape("linker arm.svg");
shp_3 = loadShape("rechter arm.svg");
shp_4 = loadShape("rechtes bein.svg");
shp_5 = loadShape("linkes bein.svg");
shp_6 = loadShape("linkes auge.svg");
shp_7 = loadShape("rechtes auge.svg");
shp_8 = loadShape("rechte pupille.svg");
shp_9 = loadShape("linke pupille.svg");
shp_10 = loadShape("mund.svg");

}

void draw(){
    int position_shp = int(random(-20,20));
    background(255); //nicht in set up sondern in draw, damit einzelne bewegungen erscheinen
  frameRate(5);
  
  pushMatrix();
  beginShape();
   shape (shp_1,width/2, height/2 + position_shp); 
   shape (shp_2,width/2-50, height/2+20 + position_shp);
   shape (shp_3,width/2+50, height/2+20 + position_shp);
   shape (shp_4,width/2+40, height/2+55 );
   shape (shp_5,width/2-40, height/2+55 );
   shape (shp_6,width/2-15 + position_shp, height/2-10 );
   shape (shp_7,width/2+15 + position_shp, height/2-10 );
   shape (shp_8,width/2-17  + position_shp, height/2-11);
   shape (shp_9,width/2+17 + position_shp, height/2-11 );
   shape (shp_10,width/2 + position_shp, height/2+10 );
   endShape();
  popMatrix();
}



