
float margin = 120;  //MARGIN
float x1;
float y1;
float di;
float alph = random(200,255);
float fiftyShadesOfGrey = random(100,255); //THE RANDOM SHADES OF GREY

void setup() {
 size(500,500);
 smooth();

}

void draw() {
 background(0);
  for (int i=1; i < 200; i++){
 //DRAW THE FIRST POINT AT THE FIRST RANDOM POSITION
 di = random(5,15);
 x1 = random(margin,width-margin);
 x1 = random(margin,height-margin);
 fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
 noStroke();
 ellipse(x1,y1,di,di);

  // CREATE OTHER POINTS & CONNECTING LINE

    // CREATE A NEW RANDOM POSITION
    float x2 = random(margin,width-margin);
    float y2 = random(margin,height-margin);
    // DRAW THE LINE FROM AN OLD POSITION TO A NEW POSITION
    stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
    line (x1,y1,x2,y2); // DRAW



        float x3 = random(mouseX-random(100),mouseX+random(100));
        float y3 = random(mouseY-random(100),mouseY+random(100));
        stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, random(0,150));  
        line (x2,y2, x3, y3); 
        stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, random(0,150));  
        line (x1,y1,x3,y3);                     
        line (x2,y2,mouseX,mouseY); 
        di = random(3,5);
        fiftyShadesOfGrey = random(100,255); 
        alph = random(50,200);
        fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
        noStroke();
        ellipse(x3,y3,di,di); // DRAW     
    
    

        float x4 = random(mouseX-random(155),mouseX+random(155));
        float y4 = random(mouseY-random(155),mouseY+random(155));
        stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, random(0,150));  
        line (x2,y2, x4, y4); 
        stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, random(0,150));  
        line (x1,y1,x4,y4);                     
        di = random(3,8);
        fiftyShadesOfGrey = random(100,255); 
      alph = random(200,255);
        fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
        noStroke();
        ellipse(x4,y4,di,di); // DRAW            
    
    
    float x5 = random(mouseX-random(50),mouseX+random(50));
    float y5 = random(mouseY-random(50),mouseY+random(50));
        stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, random(0,150));  
         line (x2,y2, x5, y5); 
         stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, random(0,150));  
          line (x1,y1,x5,y5);                     
       di = random(2,5);
      fiftyShadesOfGrey = random(100,255); 
      alph = random(200,255);
    fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
    noStroke();
    ellipse(x5,y5,di,di); // DRAW    
                
            
            
            
    // NOW X1 and Y1 REFER TO THE NEW POSITION
    x1 = x2;
    y1 = y2;

    // DRAW THE NEW POINT AT THE NEW POSITION
    di = random(3,8);
fiftyShadesOfGrey = random(100,255); 
       alph = random(200,255);
    fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
    noStroke();
    ellipse(x1,y1,di,di); // DRAW   

        
   
  
 }
 
 float sgn = 170;

     fiftyShadesOfGrey = random(100,150);
     alph = random(100,200);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (x1,y1,565-sgn,657-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(565-sgn,657-sgn,di,di);
     
     fiftyShadesOfGrey = random(80,180);
    alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (565-sgn,657-sgn,579-sgn,636-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(579-sgn,636-sgn,di,di);
     
     
     fiftyShadesOfGrey = random(80,180);
    alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (579-sgn,636-sgn,576-sgn,658-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(576-sgn,658-sgn,di,di);
     
     
     fiftyShadesOfGrey = random(80,180);
   alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (576-sgn,658-sgn,590-sgn,638-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(590-sgn,638-sgn,di,di);
     
     
     fiftyShadesOfGrey = random(80,180);
    alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (590-sgn,638-sgn,578-sgn,658-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(578-sgn,658-sgn,di,di);
     
     fiftyShadesOfGrey = random(80,180);
    alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (578-sgn,658-sgn,582-sgn,658-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(582-sgn,658-sgn,di,di);
     
     fiftyShadesOfGrey = random(80,180);
     alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (582-sgn,658-sgn,589-sgn,651-sgn);
     di = random(3,5);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(592-sgn,647-sgn,di,di);
     
     fiftyShadesOfGrey = random(80,180);
   alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (589-sgn,651-sgn,586-sgn,658-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(586-sgn,658-sgn,di,di);
     
     
     fiftyShadesOfGrey = random(80,180);
     alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (586-sgn,658-sgn,592-sgn,658-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(592-sgn,658-sgn,di,di);
     
     
     fiftyShadesOfGrey = random(80,180);
    alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (592-sgn,658-sgn,607-sgn,635-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(607-sgn,635-sgn,di,di);
     
     
     fiftyShadesOfGrey = random(80,180);
   alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (592-sgn,658-sgn,607-sgn,635-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(607-sgn,635-sgn,di,di);
     
     fiftyShadesOfGrey = random(80,180);
    alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (607-sgn,635-sgn,595-sgn,658-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(695-sgn,658-sgn,di,di);
     
     fiftyShadesOfGrey = random(80,180);
    alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (595-sgn,658-sgn,600-sgn,658-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(600-sgn,658-sgn,di,di);
     
     fiftyShadesOfGrey = random(80,180);
   alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (600-sgn,658-sgn,613-sgn,635-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(613-sgn,635-sgn,di,di);
     
     
     fiftyShadesOfGrey = random(80,180);
    alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (613-sgn,635-sgn,601-sgn,658-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(601-sgn,658-sgn,di,di);
     
     
     fiftyShadesOfGrey = random(80,180);
    alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (601-sgn,658-sgn,608-sgn,649-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(608-sgn,649-sgn,di,di);
     
          
     fiftyShadesOfGrey = random(80,180);
    alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (601-sgn,658-sgn,608-sgn,649-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(608-sgn,649-sgn,di,di);
          
     fiftyShadesOfGrey = random(80,180);
  alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (608-sgn,649-sgn,612-sgn,652-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(612-sgn,652-sgn,di,di);
     
               
     fiftyShadesOfGrey = random(80,180);
    alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (612-sgn,652-sgn,607-sgn,658-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(607-sgn,658-sgn,di,di);
     
     
     fiftyShadesOfGrey = random(80,180);
    alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (607-sgn,658-sgn,611-sgn,658-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(611-sgn,658-sgn,di,di);
         
     fiftyShadesOfGrey = random(80,180);
alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (611-sgn,658-sgn,618-sgn,650-sgn);
     di = random(3,5);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(620-sgn,647-sgn,di,di);
            
     fiftyShadesOfGrey = random(80,180);
    alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (618-sgn,650-sgn,614-sgn,658-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(614-sgn,658-sgn,di,di);
                 
     fiftyShadesOfGrey = random(80,180);
    alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (614-sgn,658-sgn,625-sgn,658-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(625-sgn,658-sgn,di,di);  
     
     fiftyShadesOfGrey = random(80,180);
     alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (625-sgn,658-sgn,638-sgn,636-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(638-sgn,636-sgn,di,di);  
     
     fiftyShadesOfGrey = random(80,180);
     alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (638-sgn,636-sgn,646-sgn,639-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(646-sgn,639-sgn,di,di);  
     
     
     fiftyShadesOfGrey = random(80,180);
  alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (646-sgn,639-sgn,648-sgn,643-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(648-sgn,643-sgn,di,di);  
     
     
     fiftyShadesOfGrey = random(80,180);
    alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (648-sgn,643-sgn,643-sgn,647-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(643-sgn,647-sgn,di,di);      
     
     fiftyShadesOfGrey = random(80,180);
   alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (643-sgn,647-sgn,634-sgn,647-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(634-sgn,647-sgn,di,di);      
     
     fiftyShadesOfGrey = random(80,180);
     alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (634-sgn,647-sgn,628-sgn,658-sgn);
     di = random(2,4);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(628-sgn,658-sgn,di,di);      
     
     fiftyShadesOfGrey = random(70,100);
     alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (628-sgn,658-sgn,669-sgn,658-sgn);
     di = random(4,5);
     float p = random(120,180);
     fill(p,p,p, alph);
     noStroke();
     ellipse(635-sgn,658-sgn,di,di);      
       
     fiftyShadesOfGrey = random(80,180);
     alph = random(200,255);
     stroke(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     line (594-sgn,641-sgn,618-sgn,641-sgn);
     di = random(2,3);
     fill(fiftyShadesOfGrey,fiftyShadesOfGrey,fiftyShadesOfGrey, alph);
     noStroke();
     ellipse(594-sgn,641-sgn,di,di);     
     ellipse(618-sgn,641-sgn,di,di);      

 
} 


