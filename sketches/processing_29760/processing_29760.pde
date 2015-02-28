
String derFischer = "Johann Wolfgang von Goethe. Der Fischer. Das Wasser rauscht', das Wasser schwoll, ein Fischer saß daran, sah nach dem Angel ruhevoll, kühl bis ans Herz hinan."
+"Und wie er sitzt und wie er lauscht, teilt sich die Flut empor; aus dem bewegten Wasser rauscht ein feuchtes Weib hervor."
+"Sie sang zu ihm, sie sprach zu ihm:  Was lockst du meine Brut  mit Menschenwitz und Menschenlist  hinauf in Todesglut?  Ach wüßtest du, wie's Fischlein ist  so wohlig auf dem Grund,  du stiegst herunter, wie du bist,  und würdest erst gesund."
+"Labt sich die liebe Sonne nicht,  der Mond sich nicht im Meer?  Kehrt wellenatmend ihr Gesicht  nicht doppelt schöner her?  Lockt dich der tiefe Himmel nicht,  das feuchtverklärte Blau?  Lockt dich dein eigen Angesicht nicht her in ew'gen Tau?"
+"Das Wasser rauscht, das Wasser schwoll,  netzt ihm den nackten Fuß;  sein Herz wuchs ihm so sehnsuchtsvoll,  wie bei der Liebsten Gruß.  Sie sprach zu ihm, sie sang zu ihm;  da war's um ihn geschehn:  Halb zog sie ihn, halb sank er hin und ward nicht mehr gesehn.";

PFont myFont;

//PImage goethe;

void setup(){
  
 size (594, 800);
 smooth (); 



 //Typo
 myFont = createFont ("Verdana", 70);
 textFont(myFont);
 
 //Bild
 //goethe=loadImage ("goethe_johann_wolfgang_von-3.jpg");
 
}


void draw(){
 
  if (mousePressed){
  
   //Bild färben
   // tint (random (0, 255), random (0, 255), random (0, 255));
   // Bild anzeigen
   //image(goethe, 0, 0);
   
   
   int a=10, b=10, c=10, d=10, e=10, f=10, g=10, h=10, i=10, j=10, k=10, l=10, m=10, n=10;
   int o=10, p=10, q=10, r=10, s=10, t=10, u=10, v=10, w=10, x=10, z=10;



   for (int y=0; y<derFischer.length(); y=y+1) {
   
   
    if (derFischer.charAt(y) =='a' || derFischer.charAt(y) =='A'){ 
      a=a+1;
    }  
    
    if (derFischer.charAt(y) =='b' || derFischer.charAt(y) =='B'){ 
      b=b+1;
    }  
    
    if (derFischer.charAt(y) =='c' || derFischer.charAt(y) =='C'){ 
      c=c+1;
    }  
    
    if (derFischer.charAt(y) =='d' || derFischer.charAt(y) =='D'){ 
      d=d+1;
    } 
    
    if (derFischer.charAt(y) =='e' || derFischer.charAt(y) =='E'){ 
      e=e+1;
    }
    
    if (derFischer.charAt(y) =='f' || derFischer.charAt(y) =='F'){ 
      f=f+1;
    }  
    
    if (derFischer.charAt(y) =='g' || derFischer.charAt(y) =='G'){ 
      g=g+1;
    }  
    
    if (derFischer.charAt(y) =='h' || derFischer.charAt(y) =='H'){ 
      h=h+1;
    }  
    
    if (derFischer.charAt(y) =='i' || derFischer.charAt(y) =='I'){ 
      i=i+1;
    } 
    
    if (derFischer.charAt(y) =='j' || derFischer.charAt(y) =='J'){ 
      j=j+1;
    }  

    if (derFischer.charAt(y) =='k' || derFischer.charAt(y) =='K'){ 
      k=k+1;
    }  
    
    if (derFischer.charAt(y) =='l' || derFischer.charAt(y) =='L'){ 
      l=l+1;
    }  
    
    if (derFischer.charAt(y) =='m' || derFischer.charAt(y) =='M'){ 
      m=m+1;
    }  
    
    if (derFischer.charAt(y) =='n' || derFischer.charAt(y) =='N'){ 
      n=n+1;
    } 
    
    if (derFischer.charAt(y) =='o' || derFischer.charAt(y) =='O'){ 
      o=o+1;
    }
    
    if (derFischer.charAt(y) =='p' || derFischer.charAt(y) =='P'){ 
      p=p+1;
    }  
    
    if (derFischer.charAt(y) =='q' || derFischer.charAt(y) =='Q'){ 
      q=q+1;
    }  
    
    if (derFischer.charAt(y) =='r' || derFischer.charAt(y) =='R'){ 
      r=r+1;
    }  
    
    if (derFischer.charAt(y) =='s' || derFischer.charAt(y) =='S'){ 
      s=s+1;
    } 
    
    if (derFischer.charAt(y) =='t' || derFischer.charAt(y) =='T'){ 
      t=t+1;
    } 

    if (derFischer.charAt(y) =='u' || derFischer.charAt(y) =='U'){ 
      u=u+1;
    }  
    
    if (derFischer.charAt(y) =='v' || derFischer.charAt(y) =='V'){ 
      v=v+1;
    }  
    
    if (derFischer.charAt(y) =='w' || derFischer.charAt(y) =='W'){ 
      w=w+1;
    }  
    
    if (derFischer.charAt(y) =='x' || derFischer.charAt(y) =='X'){ 
      x=x+1;
    } 
    
    if (derFischer.charAt(y) =='z' || derFischer.charAt(y) =='Z'){ 
      z=z+1;
    }   
    
   }
   
   
   println ("a=" + a);
   fill (255, a*4);
   textSize (a*2);
   text ("a", random (width-50), random(50, height));
   
   println ("b=" + b);
   fill (255, b*4);
   textSize (b*2);
   text ("b", random (width-50), random(50, height));
  
   println ("c=" + c);
   fill (255, c*4);
   textSize (c*2);
   text ("C", random (width-50), random(50, height));

   println ("d=" + d);
   fill (255, d*4);
   textSize (d*2);
   text ("D", random (width-50), random(50, height));
   
   println ("e=" + e);
   fill (255, e*4);
   textSize (e*2);
   text ("E", random (width-110), random(110, height));
   
   println ("f=" + f);
   fill (255, f*4);
   textSize (f*2);
   text ("F", random (width-50), random(50, height));
   
   println ("g=" + g);
   fill (255, g*4);
   textSize (g*2);
   text ("G", random (width-50), random(50, height));
  
   println ("h=" + h);
   fill (255, h*4);
   textSize (h*2);
   text ("h", random (width-90), random(90, height));

   println ("i=" + i);
   fill (255, i*4);
   textSize (i*2);
   text ("i", random (width-90), random(90, height));
   
   println ("j=" + j);
   fill (255, j*4);
   textSize (j*2);
   text ("j", random (width-50), random(50, height));

   println ("k=" + k);
   fill (255, k*4);
   textSize (k*2);
   text ("k", random (width-50), random(50, height));
   
   println ("l=" + l);
   fill (255, l*4);
   textSize (l*2);
   text ("L", random (width-50), random(50, height));
  
   println ("m=" + m);
   fill (255, m*4);
   textSize (m*2);
   text ("M", random (width-50), random(50, height));

   println ("n=" + n);
   fill (255, n*4);
   textSize (n*2);
   text ("n", random (width-80), random(80, height));
   
   println ("o=" + o);
   fill (255, o*4);
   textSize (o*2);
   text ("o", random (width-50), random(50, height));
   
   println ("p=" + p);
   fill (255, p*4);
   textSize (p*2);
   text ("p", random (width-50), random(50, height));
   
   println ("q=" + q);
   fill (255, q*4);
   textSize (q*2);
   text ("Q", random (width-50), random(50, height));
  
   println ("r=" + r);
   fill (255, r*4);
   textSize (r*2);
   text ("R", random (width-50), random(50, height));

   println ("s=" + s);
   fill (255, s*4);
   textSize (s*2);
   text ("S", random (width-90), random(90, height));
   
   println ("t=" + t);
   fill (255, t*4);
   textSize (t*2);
   text ("T", random (width-50), random(50, height));

   println ("u=" + u);
   fill (255, u*4);
   textSize (u*2);
   text ("U", random (width-50), random(50, height));
   
   println ("v=" + v);
   fill (255, v*4);
   textSize (v*2);
   text ("v", random (width-50), random(50, height));
  
   println ("w=" + w);
   fill (255, w*4);
   textSize (w*2);
   text ("W", random (width-50), random(50, height));

   println ("x=" + x);
   fill (255, x*4);
   textSize (x*2);
   text ("x", random (width-50), random(50, height));
   
   println ("z=" + z);
   fill (255, z*4);
   textSize (z*2);
   text ("z", random (width-50), random(50, height));
   
  // fill (255);
  // text ("Der Fischer", width/3, height-50);
   
 
    
   println ("a=" + a);
   fill (0, a*4);
   textSize (a*2);
   text ("A", random (width-50), random(50, height));
   
   println ("b=" + b);
   fill (0, b*4);
   textSize (b*2);
   text ("B", random (width-50), random(50, height));
  
   println ("c=" + c);
   fill (0, c*4);
   textSize (c*2);
   text ("c", random (width-50), random(50, height));

   println ("d=" + d);
   fill (0, d*4);
   textSize (d*2);
   text ("d", random (width-50), random(50, height));
   
   println ("e=" + e);
   fill (0, e*4);
   textSize (e*2);
   text ("e", random (width-110), random(110, height));
   
   println ("f=" + f);
   fill (0, f*4);
   textSize (f*2);
   text ("f", random (width-50), random(50, height));
   
   println ("g=" + g);
   fill (0, g*4);
   textSize (g*2);
   text ("g", random (width-50), random(50, height));
  
   println ("h=" + h);
   fill (0, h*4);
   textSize (h*2);
   text ("H", random (width-90), random(90, height));

   println ("i=" + i);
   fill (0, i*4);
   textSize (i*2);
   text ("I", random (width-90), random(90, height));
   
   println ("j=" + j);
   fill (0, j*4);
   textSize (j*2);
   text ("J", random (width-50), random(50, height));

   println ("k=" + k);
   fill (0, k*4);
   textSize (k*2);
   text ("K", random (width-50), random(50, height));
   
   println ("l=" + l);
   fill (0, l*4);
   textSize (l*2);
   text ("l", random (width-50), random(50, height));
  
   println ("m=" + m);
   fill (0, m*4);
   textSize (m*2);
   text ("m", random (width-50), random(50, height));

   println ("n=" + n);
   fill (0, n*4);
   textSize (n*2);
   text ("N", random (width-80), random(80, height));
   
   println ("o=" + o);
   fill (0, o*4);
   textSize (o*2);
   text ("O", random (width-50), random(50, height));
   
   println ("p=" + p);
   fill (0, p*4);
   textSize (p*2);
   text ("P", random (width-50), random(50, height));
   
   println ("q=" + q);
   fill (0, q*4);
   textSize (q*2);
   text ("q", random (width-50), random(50, height));
  
   println ("r=" + r);
   fill (0, r*4);
   textSize (r*2);
   text ("r", random (width-50), random(50, height));

   println ("s=" + s);
   fill (0, s*4);
   textSize (s*2);
   text ("s", random (width-90), random(90, height));
   
   println ("t=" + t);
   fill (0, t*4);
   textSize (t*2);
   text ("t", random (width-50), random(50, height));

   println ("u=" + u);
   fill (0, u*4);
   textSize (u*2);
   text ("u", random (width-50), random(50, height));
   
   println ("v=" + v);
   fill (0, v*4);
   textSize (v*2);
   text ("V", random (width-50), random(50, height));
  
   println ("w=" + w);
   fill (0, w*4);
   textSize (w*2);
   text ("w", random (width-50), random(50, height));

   println ("x=" + x);
   fill (0, x*4);
   textSize (x*2);
   text ("X", random (width-50), random(50, height));
   
   println ("z=" + z);
   fill (0, z*4);
   textSize (z*2);
   text ("Z", random (width-50), random(50, height));
   
   noLoop ();
  
   
  }else{
    
   
  textSize (18);
  textLeading (30);          // Zeilenabstand
  fill (255);      
  text ("Johann Wolfgang von Goethe \n\nDer Fischer \n\nDas Wasser rauscht', das Wasser schwoll, \nein Fischer saß daran, \nsah nach dem Angel ruhevoll, \nkühl bis ans Herz hinan."
+"\nUnd wie er sitzt und wie er lauscht, \nteilt sich die Flut empor; \naus dem bewegten Wasser rauscht \nein feuchtes Weib hervor."
+"\nSie sang zu ihm, sie sprach zu ihm: \n Was lockst du meine Brut \n mit Menschenwitz und Menschenlist \n hinauf in Todesglut?  \nAch wüßtest du, wie's Fischlein ist  \nso wohlig auf dem Grund,  \ndu stiegst herunter, wie du bist, \n und würdest erst gesund.\n\n(...)", 30, 30, width-10, height-30);

    
  }


}

