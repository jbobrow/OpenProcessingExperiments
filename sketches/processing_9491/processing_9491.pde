
PFont maFonte;
String monTexte;
PFont otherFonte;
String txtDescript;
int nbreCarac;
char lettre;
Boolean bgColor=true;

void setup()
{
    size(400,400);
    smooth();
    frameRate(15);
       
    maFonte = loadFont("SynchroLET-48.vlw");
    monTexte="Playing with code !! You wanna try ?";
    
    otherFonte = loadFont("TrebuchetMS-12.vlw");
}

void draw()
{ 
   background(178,152,155);

   //display grouping txt  
   translate(10,30);   
   textFont(maFonte,30);  
   textAlign(BASELINE);
   for(int i=100 ; i < 150 ; i++){
       fill(i,i,i);
       text("Processing.org", i-100, i-100); 
    }
  
    fill(200,200,200);
    text("Processing.org", 50, 50);

    
    //////////////////////////////////
    //display letters one by one
    pushMatrix();
    translate(200,200);
    rotate(radians(150));
    nbreCarac = monTexte.length();
    fill(255,255,255);
    for(int i=0 ; i < nbreCarac ; i++)
    {
      rotate(radians(17));
      lettre = monTexte.charAt(i);
      pushMatrix();
      translate(i+40,0);
      rotate(radians(90));
      text(lettre,0,0);
      popMatrix();      
    } 
    popMatrix();
    textFont(otherFonte,12);
    fill(0,0,0);
    textAlign(CENTER);
    text("Clic to delete the entire dynamic text \nHold Backspace to erase the last caracter", width/2, 350);
}
void keyPressed()
{
  if(keyCode==BACKSPACE){
    
     if(nbreCarac > 0)
     {
       monTexte = monTexte.substring(0,nbreCarac-1);

     }
  }
  else
  {
    monTexte = monTexte + key;
  }
}

void mousePressed()
{
  monTexte = "";
}


