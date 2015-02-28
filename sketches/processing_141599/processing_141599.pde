
/*** SWEARING HABITS
*** BY JACOB HILL
*** DIGITAL ARTS | UNIVERSITY OF OREGON
*** I set out to question cultural taboos and see which swear words 
***college-aged students have an affinity for and the frequencey with
***which they use these words. All graphics, including the background 
***of black and white roses, are my own. The background was achieved 
***by cropping an existing rose from a past painting of mine and
***duplicating it multiple times and turning the resulting image black
***and white. The only graphic I hold no ownership over is the 
***"explicit" label, an image I found on npr.org. Although my project 
***is grounded in data collection, as a future Ad major, I used the 
***data I collected as a means to creat an interactive infographic and
***created a largely aesthetics based and simplistic finished product.
***/

PImage shit;
PImage fuck;
PImage bitch;
PImage damn;
PImage poison;
PImage page;
// assigns names to the images that will later be loaded in as backgrounds

void setup(){
  size(500,600); //sets the size of the canvas to the size of the image
 page = loadImage("page.png"); //loads in the background image
 background (page); //sets the background image to page
}

void draw(){ //used as a place holder to allow mousePressed to run
}
void mousePressed(){

  bitch = loadImage ("bitch.png");
  shit = loadImage ("shit.png");
  fuck = loadImage ("fuck.png");
  damn = loadImage ("damn.png");
  poison = loadImage ("poison.png");//loads in the rest of the images needed


  println(mouseX + ", " + mouseY);
{
  if (mouseX > 310 && mouseX < 432 && mouseY > 363 && mouseY < 416) {
   background (bitch); //causes bitch.png to load when "bitch" is clicked
  }

  if (mouseX > 71 && mouseX < 200 && mouseY > 481 && mouseY < 517){
    background (damn); //causes damn.png to load when "damn" is clicked
  }

   if (mouseX > 335 && mouseX < 431 && mouseY > 469 && mouseY < 525) {
    background (shit); //causes shit.png to load when "shit" is clicked
  }

  if (mouseX > 71 && mouseX < 183 && mouseY > 363 && mouseY <416){
    background (fuck);} //causes fuck.png to load when "fuck" is clicked
    
    if (mouseX > 229 && mouseX < 475 && mouseY > 548 && mouseY < 581){
    background (poison);} // loads poison when "continue" is clicked
    
     if (mouseX > 416 && mouseX < 473 && mouseY > 18 && mouseY < 100){
    background (poison);} //assigns a "home" button so the user may try out different words
    
}
}



