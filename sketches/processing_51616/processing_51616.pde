
class House{
int rad;int batiw, batih;
int ttw, tth;int offset;
byte hporte = 22;
byte lporte = 8;
int quart;int sol;int fen;
color gris = color(160,170,180);
color brique = color(170,100,100);
color blanc = 255;
color brun = color(100,50,0);
color vert = color(70,120, 80);
//variable indépendante pour dispatch toit
float nr;
int etage = 25;int ecaa;


void constr(int x, int y){
  quart = boite/4;
       int xh = floor(random(quart,boite-quart)); x = x+xh;
       int mgx = xh;  int mdx = boite-xh;
       int yh = floor(random( boite/2)); y = y+yh;


       if( xh < boite/2){ rad = floor(random(10,xh)); } 
       else { rad = floor(random(10,boite-xh));}
                          offset= rad/5;
                          fen = offset*2;
                          batiw = rad*2;
                          ttw = batiw+offset;
                          int mg = mgx-rad;  int md = mdx-rad;
                    
                    // yh détermine tth, batih
                    if(yh < boite/2){
                      tth = floor(random(16,yh));
                      batih = round(random(hporte, boite-yh));
                                     }
                      else { tth = int(batih*.6);}
                    sol= y+batih;
        //ligne de sol
        strokeWeight(1);
        line(x-ttw/2,sol,x+ttw/2,sol);
                    //bati h
                    fill(blanc);
                    rect(x-batiw/2, y, batiw, batih);
                    noFill();


        //toit
        if(rad <= 20){ tth = rad;}
        else{  tth = round(random(yh));}

                //options toits
                  nr  = random(1);
                //toit plat  // 2 parpaings
                if(nr <= 0.33) { fill(255);rect(x-rad,y-4,3,4);
                                rect(x+rad-3, y-4 , 3,4);noFill(); }
                //corniche       
                if(nr <= 0.33 && batiw >= quart){  fill(blanc);
                rect(x-ttw/2,y,ttw,-4);  noFill();
                stroke(128);
                line(x-ttw/2, y+1, x+ttw/2, y+1);//ombre corniche
                stroke(0);}
        
                //toit rond
                if(nr >= 0.33 && nr < 0.66){    fill(blanc);
                arc(x,y, batiw,tth,PI,TWO_PI);
                        if(rad%5 == 0 && batiw >= batih){
                        quad(x-batiw/2,y+1,x-ttw/2, y-3,x+ttw/2,y-3,x+batiw/2, y+1);
                        noFill();}}
                        
                //toit triangulaire
                if(nr >= .66 && nr <= .88) {                  fill(gris);
                    triangle(x-ttw/2, y, x, y-tth, x+ttw/2, y);noFill();
                    stroke(128); line(x-ttw/2, y+1, x+ttw/2, y+1); stroke(0);
                }
                //toit trapezoidal
                if(nr >= .88 && nr <= 1.00) {                  fill(brique);
                    quad(x-ttw/2, y, x-offset, y-tth/2, x+offset, y-tth/2, x+ttw/2, y);noFill();
                    stroke(128); line(x-ttw/2, y+1, x+ttw/2, y+1); stroke(0);
                }

//porte et fenetres

        fill(random(160,240));
        rect(x-lporte/2, sol-hporte, lporte, hporte);
        noFill();//+ombre
        stroke(128);line(x-lporte/2, sol-hporte+1,x+lporte/2,sol-hporte+1);stroke(0);
        
        int largmin1 = 35;
        if(batiw >= largmin1){rect(x-fen*2, sol-hporte, fen, fen);
                        stroke(128);line(x-fen*2,sol-hporte+1,x-fen,sol-hporte+1);stroke(0);}
                        
        int largmini2 = 50;
        if(batiw >= largmini2){rect(x+fen, sol-hporte, fen, fen);//+ombre
                        stroke(128);line(x+fen,sol-hporte+1,x+fen*2,sol-hporte+1);stroke(0);}

        //conditions pour un quart, 2 quarts, etc
        if(batih >= etage*1.6){ rect(x-lporte/2, y+offset, lporte, lporte);//1 fen  + ombre
                            stroke(128); line(x-lporte/2, y+offset+1,x+lporte/2,y+offset+1);stroke(0);}
        if(batih >= etage*2 && batiw > largmini2){ //else if bloquait les fen étage
                            rect(x-fen*2, y+offset, fen, fen);// +ombre
                            stroke(128); line(x-fen*2, y+offset+1,x-fen,y+offset+1);stroke(0);
                            rect(x+fen, y+offset, fen, fen);//+ombre
                            stroke(128); line(x+fen, y+offset+1,x+fen*2,y+offset+1);stroke(0);}
        if(batih >= etage*3 && batiw > largmini2){ //else if bloquait les fen étage
                            rect(x-fen*2, sol-etage*2, fen, fen);// +ombre
                            stroke(128); line(x-fen*2, sol-etage*2+1,x-fen,sol-etage*2+1);stroke(0);
                            rect(x+fen, sol-etage*2, fen, fen);//+ombre
                            stroke(128); line(x+fen, sol-etage*2+1,x+fen*2,sol-etage*2+1);stroke(0);}
                            
// ARBRES répartition
          int ah = int(random(20,100));
          //arbre à gauche ou droite selon x
          if  (mg >= 30 && mg >= md){ ecaa = rad - int(random(mg));}
          if  (md >= 20 && mg < md) { ecaa = rad + int(random(md)); }

          if( nr <= .75){
          stroke(brun);strokeWeight(2);
          line(x+ecaa, sol, x+ecaa, sol-ah);
          fill(vert);noStroke();
          ellipse(x+ecaa,sol-ah,nr*ah/3+lporte, rad+offset);
          noFill();
          stroke(0);strokeWeight(1);
          line(x, sol, x+ecaa, sol);line(x-ecaa/2, sol, x+ecaa/2, sol); }
          
    //option réverbère

          else {
                      int hrev = hporte*3;//hauteur standart
          fill(blanc);
                    if(ecaa < 0){
                    line(x+ecaa-16, sol, x+ecaa-16,sol-hrev);
                    ellipse(x+ecaa,sol-hrev+1,6,6);
                    noFill();
                    arc(x+ecaa-lporte-1, sol-hrev,14,14,PI,TWO_PI);
                    stroke(255);strokeWeight(2);
                    line(x+ecaa-lporte*2, sol, x+ecaa+lporte*2, sol);stroke(0);strokeWeight(1);
                    }
          }                                  
}
}

