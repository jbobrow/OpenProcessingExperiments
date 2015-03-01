
//Arthur Luo//
//Glitchdelphia//


//Try to press your mouse button. See for yourself.//



PImage system_failure, windows_7,system_failure_short;
PFont Matrix_1, Matrix_2, Solid, chinese;
int counting=0;
float moving_right=0;
boolean higher_number=true, desktop;


  //loading images. Size of the sketch is 768*480.
void setup(){
  background( 17, 165, 17);
  size( 768, 480);
  system_failure_short = loadImage("system_failure_short.jpg");
  windows_7 = loadImage("windows_7.jpg");
  system_failure = loadImage("system_failure.jpg");
  Matrix_1 = loadFont("Matrix_1.ttf");
  Matrix_2 = loadFont("Matrix_2.ttf");
  Solid = loadFont("Solid.ttf");
  chinese = loadFont("chinese.ttf");
}


 //When pressing the mouse, system_failure shows up.
void mousePressed(){
  image( system_failure, 0, 0); 
}


  //Boolean way of doing things. Thx to @Cole Smith.
void draw(){
  
  randomSeed(0);
  
  moving_right = moving_right+2.2;
  
  println(counting);
  
  if(counting == 1200){
    counting = counting-1200;
    moving_right = 0;  
  }
  
  if(counting == 0){
    higher_number = true;
  }
  
  if(higher_number){
    counting = counting+1;
  }
  
  //While pressing down.
  if(mousePressed == true){
    
    //Whole bunch of Texts. Beware!!!
     if(counting<=400){
      image( system_failure, 0, 0);
      
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
     
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr.Smit_"
      textFont(Matrix_2,11);
      text("Mr.Smit_", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Please wait..."
      textFont(Matrix_2,random(21));
      text("Please wait...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Please wait..."
      textFont(Matrix_2,random(21));
      text("Please wait...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Please wait..."
      textFont(Matrix_2,random(21));
      text("Please wait...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Please wait..."
      textFont(Matrix_2,random(21));
      text("Please wait...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Please wait..."
      textFont(Matrix_2,random(21));
      text("Please wait...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr.Smit_"
      textFont(Matrix_2,random(21));
      text("Mr.Smit_", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr.Smit_"
      textFont(Matrix_2,random(21));
      text("Mr.Smit_", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr.Smit_"
      textFont(Matrix_2,random(21));
      text("Mr.Smit_", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      //"Hellow world."
      textFont(Matrix_2,24);
      text("Hello world", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17); 
      
      //"System shut down"
      textFont(Matrix_1,18);
      text("System shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr. Smith infiltrated..."
      textFont(Matrix_2,12);
      text("Mr. Smith infiltrated...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Welcome back."
      textFont(Matrix_2,12);
      text("Welcome back.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);  
      
      //"Problem resolved"
      textFont(Matrix_2,16);
      text("Problem resolved", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"!!#($*(%!#$(^(#&$(!&#$"
      textFont(Matrix_2,9);
      text("!!#($*(%!#$(^(#&$(!&#$", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Control panel shut down"
      textFont(Matrix_2,14);
      text("Control panel shut down", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Relocated"
      textFont(Matrix_2,20);
      text("Relocated", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"ha__ dri_ C:.._ re_rogra_ming"
      textFont(Matrix_2,19);
      text("ha__ dri_ C:.._ re_rogra_ming", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Copying..."
      textFont(Matrix_2,12);
      text("Copying...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Serial_Number:191681684516846"
      textFont(Matrix_2,16);
      text("Serial_Number:191681684516846", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Rebooting..."
      textFont(Matrix_2,22);
      text("Rebooting...", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Windows file deleted."
      textFont(Matrix_2,20);
      text("Windows file deleted.", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      
      //"Mr.Smit_"
      textFont(Matrix_2,random(21));
      text("Mr.Smit_", moving_right+random(-768,768), random(-480,480));
      fill( 17, 165, 17);
      }
      
      if(counting>400 && counting<=800){
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        fill(random(0,255),random(0,255),random(0,255));
        rect( random(768), random(480), random(10), random(80));
        textFont(Matrix_2,14);
        text("Control panel shut down", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,20);
        text("Relocated", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,19);
        text("ha__ dri_ C:.._ re_rogra_ming", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,12);
        text("Copying...", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,16);
        text("Serial_Number:191681684516846", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,22);
        text("Rebooting...", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,20);
        text("Windows file deleted.", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,random(21));
        text("Mr.Smit_", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,14);
        text("Control panel shut down", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,20);
        text("Relocated", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,19);
        text("ha__ dri_ C:.._ re_rogra_ming", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,12);
        text("Copying...", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,16);
        text("Serial_Number:191681684516846", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,22);
        text("Rebooting...", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,20);
        text("Windows file deleted.", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,random(21));
        text("Mr.Smit_", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,14);
        text("Control panel shut down", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,20);
        text("Relocated", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,19);
        text("ha__ dri_ C:.._ re_rogra_ming", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,12);
        text("Copying...", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,16);
        text("Serial_Number:191681684516846", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,22);
        text("Rebooting...", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,20);
        text("Windows file deleted.", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,random(21));
        text("Mr.Smit_", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,14);
        text("Control panel shut down", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,20);
        text("Relocated", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,19);
        text("ha__ dri_ C:.._ re_rogra_ming", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,12);
        text("Copying...", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,16);
        text("Serial_Number:191681684516846", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,22);
        text("Rebooting...", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,20);
        text("Windows file deleted.", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,random(21));
        text("Mr.Smit_", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,14);
        text("Control panel shut down", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,20);
        text("Relocated", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,19);
        text("ha__ dri_ C:.._ re_rogra_ming", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,12);
        text("Copying...", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,16);
        text("Serial_Number:191681684516846", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,22);
        text("Rebooting...", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,20);
        text("Windows file deleted.", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,random(21));
        text("Mr.Smit_", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,14);
        text("Control panel shut down", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,20);
        text("Relocated", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,19);
        text("ha__ dri_ C:.._ re_rogra_ming", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,12);
        text("Copying...", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,16);
        text("Serial_Number:191681684516846", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,22);
        text("Rebooting...", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,20);
        text("Windows file deleted.", +random(768), random(480));
        fill( 17, 165, 17);
        textFont(Matrix_2,random(21));
        text("Mr.Smit_", +random(768), random(480));
        fill( 17, 165, 17);
        }
    
      }  
  noStroke();
  
  if(counting>800 && counting<=1200){
    desktop=true;
  }
        
}



  //When the mouse is released, everything goes back to normal.
void mouseReleased(){
  
  if(desktop=true){
    image(system_failure_short, 300, 220);
  }
  
  image( windows_7, 0, 0);
  
}





