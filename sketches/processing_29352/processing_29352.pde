
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

RShape koch_island;
RPoint punt;
PFont font;
float i=0;
int j=0;
String text_poema="quodestinferiusestsicutquodestsuperiusetquodestsuperiusestsicutquodestinferiuset";

void setup(){
  size(800,900);
  background(255);
  RG.init(this);  
  font = loadFont("ArialMT-10.vlw"); 
  textFont(font); 
  fill(0);
  koch_island=RG.loadShape("koch-island-order-2-B.svg");
}

void draw(){
  translate(35,-100);
  //koch_island.draw();
  if(i<=1){
    RPoint punt=koch_island.getPoint(i);  
    if(text_poema.length()==j+1){
      j=0;
    }
    text(text_poema.charAt(j), punt.x, punt.y);
    j++;    
  }
  i=i+0.00105;
}


