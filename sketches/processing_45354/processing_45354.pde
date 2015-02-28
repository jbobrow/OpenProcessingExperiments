
class Arbre{
  
 /* Variables init */ 
 int aHeight, aWidth, aX, aY, aValX, aVitX, aRand, aRand2;
 int aPosX = 0;
 int aPosOff = 50;
 
 int bW = 7;
 int bH = 7;
 
 Arbre(int aPosXInit, int aW, int aH, int aV){
   aX = aPosXInit;
   aValX = aPosXInit;
   aHeight = aH;
   aWidth = aW;
   aVitX = aV;
  
 }
 
 void move(int v){
   aPosX = aPosX + aVitX;
   aValX = aValX - aVitX;
 }
 
 void display(){
    fill(111, 71, 0);
    pushMatrix();
      translate(((aX-aWidth)-aPosX)-72, (height-aHeight)-280);
      /* TRONC */
      rect(77.0, 273.0, bW, bH);
      rect(77.0, 266.0, bW, bH);
      rect(77.0, 259.0, bW, bH);
      rect(77.0, 252.0, bW, bH);
      rect(84.0, 245.0, bW, bH);
      rect(91.0, 238.0, bW, bH);
      rect(98.0, 231.0, bW, bH);
      rect(77.0, 245.0, bW, bH);
      rect(77.0, 238.0, bW, bH);
      rect(77.0, 231.0, bW, bH);
      rect(77.0, 224.0, bW, bH);
      rect(84.0, 217.0, bW, bH);
      rect(84.0, 210.0, bW, bH);
      rect(77.0, 210.0, bW, bH);
      rect(70.0, 203.0, bW, bH);
      rect(63.0, 196.0, bW, bH);
      rect(56.0, 189.0, bW, bH);
      rect(84.0, 203.0, bW, bH);
      rect(84.0, 196.0, bW, bH);
      rect(84.0, 189.0, bW, bH);
      rect(91.0, 182.0, bW, bH);
      rect(98.0, 175.0, bW, bH);
      rect(105.0, 168.0, bW, bH);
      rect(112.0, 161.0, bW, bH);
      rect(119.0, 154.0, bW, bH);
      rect(84.0, 182.0, bW, bH);
      rect(84.0, 175.0, bW, bH);
      rect(84.0, 168.0, bW, bH);
      rect(84.0, 161.0, bW, bH);
      rect(77.0, 154.0, bW, bH);
      rect(70.0, 147.0, bW, bH);
      rect(63.0, 140.0, bW, bH);
      rect(56.0, 133.0, bW, bH);
      rect(49.0, 126.0, bW, bH);
      rect(42.0, 119.0, bW, bH);
      rect(35.0, 112.0, bW, bH);
      rect(84.0, 154.0, bW, bH);
      rect(84.0, 147.0, bW, bH);
      rect(84.0, 140.0, bW, bH);
      rect(84.0, 133.0, bW, bH);
      rect(84.0, 126.0, bW, bH);
      rect(91.0, 119.0, bW, bH);
      rect(98.0, 112.0, bW, bH);
      rect(105.0, 105.0, bW, bH);
      rect(112.0, 98.0, bW, bH);
      rect(119.0, 91.0, bW, bH);
      rect(77.0, 119.0, bW, bH);
      rect(77.0, 112.0, bW, bH);
      rect(77.0, 105.0, bW, bH);
      rect(77.0, 98.0, bW, bH);
      rect(77.0, 91.0, bW, bH);
      rect(77.0, 84.0, bW, bH);
      rect(77.0, 77.0, bW, bH);
      rect(77.0, 70.0, bW, bH);
      rect(77.0, 63.0, bW, bH);
      rect(77.0, 56.0, bW, bH);
      rect(77.0, 49.0, bW, bH);
      rect(77.0, 42.0, bW, bH);
      rect(84.0, 56.0, bW, bH);
      rect(91.0, 49.0, bW, bH);
      rect(98.0, 42.0, bW, bH);
      rect(105.0, 35.0, bW, bH);
      rect(112.0, 28.0, bW, bH);
      rect(119.0, 21.0, bW, bH);
      rect(70.0, 91.0, bW, bH);
      rect(63.0, 84.0, bW, bH);
      rect(56.0, 77.0, bW, bH);
      rect(49.0, 70.0, bW, bH);
      rect(42.0, 63.0, bW, bH);
      rect(35.0, 56.0, bW, bH);
      rect(28.0, 49.0, bW, bH);
      rect(21.0, 42.0, bW, bH);
      rect(49.0, 84.0, bW, bH);
      rect(42.0, 91.0, bW, bH);
       /* FEUILLES */
      fill(99, 211, 0);
      rect(35.0, 126.0, bW, bH);
      rect(63.0, 154.0, bW, bH);
      rect(119.0, 168.0, bW, bH);
      rect(98.0, 161.0, bW, bH);
      rect(56.0, 203.0, bW, bH);
      rect(35.0, 84.0, bW, bH);
      rect(49.0, 56.0, bW, bH);
      rect(105.0, 21.0, bW, bH);
      rect(112.0, 42.0, bW, bH);
      rect(112.0, 84.0, bW, bH);
      rect(112.0, 112.0, bW, bH);
      rect(91.0, 105.0, bW, bH);
      rect(63.0, 126.0, bW, bH);
    popMatrix();
 }
  
  
}

