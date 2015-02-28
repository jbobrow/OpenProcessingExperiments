
import janebeta7.*;
import java.awt.Color;
/**
 * Espacio 
 * by Laura Valero. 
 * 
 * 30-05-2010
 */

Colors paletas;
float a = 0.0;
float s = 0.0;
void setup(){
  size (500,500);
  
  noStroke();
  paletas = new Colors(this);
rectMode(CENTER);
  smooth();
  paletas.addFolder(dataPath("set/"));
  paletas.setPalette(1);

}

void draw(){
  a = a + 2;
  s = cos(a)*8;
  //paletas.setPalette();
  fill(paletas.getColor());
  ellipse(random(width),random(height),2,2);
  pushMatrix();
  translate(width/2, height/2);
  scale(s); 
  



  fill(paletas.getOrderColor());
  ellipse(0,0,10,10);
  translate(width/10, height/-10);
  rect(2,2,20,20);
  translate(width/100, height/5);
  rect(2,2,10,10);
  translate(width/20, height/-10);
  ellipse(10,10,5,5);
  translate(width/100, height/-40);
  ellipse(10,10,5,5);
  popMatrix();

}
boolean[] keys = new boolean[526];
boolean checkKey(String k)
{
  for(int i = 0; i < keys.length; i++)
    if(KeyEvent.getKeyText(i).toLowerCase().equals(k.toLowerCase())) return keys[i];  
  return false;
}
void keyReleased()
{ 
  keys[keyCode] = false; 
}

void mouseReleased()
{
  paletas.setPalette();
  
 background(random(0,100));
  
}



// da error null pointer exception




