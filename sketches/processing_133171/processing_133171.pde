
int [] xpos= new int [50];// there are 50 total values but the values range from 0-49
int [] ypos = new int [50];

void setup(){
  size (800,200);
  smooth();

for (int i=0; i<xpos.length; i++){
  xpos[i] = 0;// fills the array as a null set initially so that it can be updated. If something needed to happen right away there would need to be an initialization here calling the array to complete a task. Not neccessary in this circumstance.

ypos [i] =0;
 }
}

void draw(){
  background (43,43,43);
    
for (int i=0; i<xpos.length-1;i++){
  xpos [i] = xpos [i+1];
  ypos [i] = ypos [i+1];
}
 
      xpos[xpos.length-1]=mouseX; /* to affect a specific spot within the array list you can call the length command and then substract '1' to begin speaking about an integer in the array. Meaning, the computer knows the length = 50 and the value index of each integer in the array (a number betwee 0-40). So to affect the last integer of the set you assign it as the length (50)-1 = 49 and do something to number 49 by an initialization. */

ypos[ypos.length-1]=mouseY;

for (int i=0; i<xpos.length; i++){
  stroke(random(43), random(43), random(43));
  fill (#ffffff-i*900,10);// 
  ellipse (xpos[i], ypos [i], i,i); // /*draw an ellipse for each element in the arrays. color and size are tied to the loops counter */
fill (#6483e7-(xpos[i]),10);
  //rect (xpos[i], ypos [i], i,i); // 
  ellipse (xpos[i]*3, ypos [i], i*2,i*2);   /*blue ellipse that turns and runs away when the pink ellipse turns towards it*/
 }
}
