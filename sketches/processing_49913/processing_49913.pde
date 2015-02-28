
/*
Copyright by Ben S. | HAW Amberg-Weiden

Shortcuts

'h' Hinweis an/aus
'o' Öffnen-Dialog
'z' Zufallsmodus an/aus
's' Screenshot
'f' Filmaufzeichnung starten/beenden
'e' Filter ERODE
'i' Filter INVERT

*/

String file;
byte[]data;
int counter, pos;
int vz = -1;
float rndm = 1;
boolean rndmLock = false;
boolean noteLock = false;
boolean film = false;

void draw()
{
  filter(BLUR,0.7);
  textFont(createFont("",12+mouseY*0.02));
  fill(255, 10);
  rect(0,0,width,height);
  fill(10);
  try
  {
    rect(100+4*pos,height/2,2,rndm*vz*((mouseX*0.15)+data[pos]));
    text(char(data[counter]),width-350+pos%8*30,100+pos/8*30);
  }
  catch(ArrayIndexOutOfBoundsException e)
  {
    counter = 0;
    pos = 0;
  }
  catch(NullPointerException e)
  {
    textFont(createFont("",25));
    text("Sie haben keine gueltige Datei ausgewaehlt",width/6,height/2);
  }

  if (pos > (100))
  {
    pos = 0;
    vz*=-1;
  }
  else
  {
    counter+=1;
    pos+=1;
  }
  
  if(keyPressed)keys(); 
  zufall();
  if(film)saveFrame("\\film\\" + year() + "-" + month() + "-" + day() + "_" + "#####.jpg");
}

void setup()
{
  size(700, 600);
  background(255);
  noStroke();
  importFile();
}

void importFile()
{
 // file = selectInput();
  data = loadBytes("DataLine.pde");
}

void zufall()
{
  if(rndmLock == true)
  {
    rndm = random(-1,1);
  }
  else
  {
    rndm = 1;
  }
}

void keys()
{
  if(key == 'z' && !rndmLock)
  {
    rndmLock = true;
    if(!noteLock)selectHint(1,"Zufall an");
  }
  else if (key == 'z' && rndmLock) 
  {
    rndmLock = false;
    if(!noteLock)selectHint(1,"Zufall aus");
  }
 
 // if(key == 'o')importFile();
    
  if(key == 's')
  {
    save("\\screenshots\\" + year() + "-" + month() + "-" + day() + "_" + hour() + minute() + second() + ".jpg");
    if(!noteLock)
    selectHint(2,"Datei erfolgreich gespeichert");     
  }
  
  if(key == 'f')
  {
    if(!film)
    {
      film = true;
      selectHint(2,"Aufnahme Start");
    }
    else 
    {
      film = false;
      selectHint(2,"Aufnahme Stop");
    }
  }
    
  if(key == 'e')
  {
    filter(ERODE);
    if(!noteLock)selectHint(1,"Filter: ERODE");      
  }
    
  if(key == 'i')
  {
    filter(INVERT);
    if(!noteLock)selectHint(1,"Filter: INVERT");
  }
  
  if(key == 'h')
  {
    if (!noteLock)
    {
      noteLock = true;
      selectHint(1,"Hinweis aus");    
    }
    else 
    {
      noteLock = false;
      selectHint(1,"Hinweis an");    
    }   
  }  
}

void selectHint(int nr, String text)
{
  textFont(createFont("",15));
  if(nr == 1)
  {
      text(text,width-100,height-20);       
  }
  else if(nr ==2)
  {
      text(text,width-250,height-20); 
  }  
}

