
PShape ohr_links;
PShape ohr_rechts;
PShape fuss_links;
PShape fuss_rechts;

void setup ()
{
size(600,600);
background(255); 
smooth();
frameRate (15);
shapeMode (CENTER);
    
    
ohr_links = loadShape( "ohr_l.svg" );
ohr_rechts = loadShape ("ohr_r.svg");
fuss_links = loadShape( "fuss_l.svg" );
fuss_rechts = loadShape ("fuss_r.svg");    
}
        
    
void draw()
{     
background (255);
ohren (width,30);      
fuss (width/2,300);      
kopf (width/2, 120);
mund( 200, 80 );
augen(width/2, 100);
}

////////OHREN    
void ohren (float x, float y)
{
int position_ohren = int(random(200,250));

pushMatrix();

scale(0.5);
shape (ohr_links, x-250, position_ohren);
shape (ohr_rechts, x+250, position_ohren);

popMatrix();

}
   
////FUSS
void fuss (float x, float y)    //////NIMMT WERTE VON OBEN für X und Y
{
shape (fuss_links, x-100, y);
shape (fuss_rechts, x+100, y);
    }
    
    
////KOPF    
void kopf (float x, float y)
{
pushMatrix ();   ///////////////////
      
    noStroke();
    fill(100);
    ellipse (x,y,250,160);
    rect(x-30, y+50,60,50);

    
    //HUT
    fill(0);
    rotate(radians(-20));
    rect(x-200, y+20, 230,10);
    rect(x-160, y-40, 150,70);
    
    
    popMatrix(); /////////////   
    }
    
    
    
    
    
//////AUGEN
void augen (float x, float y)
{
fill (255);
ellipse (x-80,y,80,80);
ellipse (x+80,y,80,80);

fill (0);
ellipse (x-80,y,40,40);
ellipse (x+80,y,40,40);

}



///////MUND
void mund ( float x, float y )
{
pushMatrix();   // alle werte werden eingefroren
translate(x,y);  // neuer nullpunkt wird gesetzt
     

fill(255,0,0);
beginShape();
vertex( 60, 60 );
bezierVertex( 50, 120,  60, 150,  180, 60 );
endShape( CLOSE );  
      
fill(0);
beginShape();
vertex( 60, 60 );
bezierVertex( 60, 120,  60, 120,  180, 60 );
endShape( CLOSE );  
       
fill(255);    //zähne
triangle(60,60,70,80,80,60); 
triangle(80,60,90,70,100,60); 
triangle(100,60,110,75,120,60); 
triangle(120,60,130,82,140,60); 
triangle(140,60,150,70,160,60); 
  
popMatrix();   // alle werte werden wieder zurückgesetzt

 }


