

boolean record;



 
String input = "Tester";  
float spacing = 90; 
 
void setup () 
{ 
  


    size( 1280, 1024 ); 
  


    
    
   setParameters();
  makeControls();

    
    
} 
 
 
void draw () 
{ 
  
  
  if (record) {

  saveFrame("line-####.tif"); 
  delay (20);

  }

  
  
    if ( frameCount%15 == 0 ) background( 255 );                        
    drawGenerativeText( input, 20, 40 ); 
    

} 
 
 
void keyPressed ()                             
{ 
  if ( key == ESC)   
    { 
      delay(30);
      exit(); 
 
        }   
 
 
  if ( key == BACKSPACE || key == DELETE )   
    { background (255); 
        if ( input != null && input.length() > 0 )    
        { 
            input = input.substring(0,input.length()-1);   
        } 
    } 
    else if ( key != CODED )                   
    { 
        input += key;                       
    } 
} 
 
void drawGenerativeText ( String txt, float x, float y ) 
{ 
    if ( input == null || input.trim().equals("") ) return;    
 


       
      

 
 
 strokeWeight(0.2);   
        stroke( 0 ); 
    noFill(); 
 
    pushMatrix(); 
 
    translate( x, y ); 
    translate( 15, 40 ); 
 
    for ( int i = 0; i < txt.length(); i++ ) 
    { 
        char c = input.charAt( i ); 
 
        drawGenerativeChar(c); 
    } 
 
    popMatrix(); 
} 
 
void rLine (float x1, float y1, float x2, float y2) 



{ 
  
    
  
int rad = round(Italic); 
  int schritte = round(Lines); 
  for (int i = 0; i<schritte; i++){ 
  float xx = map (i,0,schritte-1, x1,x2); 
  float yy = map (i,0,schritte-1, y1,y2); 
 

 line (xx,yy,xx+Strokex/6,yy-Strokey/6);  

 line (x1,y1,x2,y2);  
  } 
} 

 
void drawGenerativeChar ( char c ) 
{ 
    switch ( c ) 
    { 
      case '\n': 
        draw_enter(); 
        break; 
     
      case '-': 
        draw_dash(); 
        break; 
        
         case '.': 
        draw_point(); 
        break; 
        
        
        case ',': 
        draw_comma(); 
        break;  
     
     
      case ' ': 
        draw_space(); 
        break; 
      
      case 'a': 
        draw_a(); 
        break; 
        
      case 'A': 
        draw_A(); 
        break; 
    
    case 'b': 
        draw_b(); 
        break; 
        
    case 'B': 
        draw_B(); 
        break;     
        
    case 'c': 
        draw_c(); 
        break; 
        
       case 'C': 
        draw_C(); 
        break;   
   
      
    case 'd': 
        draw_d(); 
        break; 
   
    case 'D': 
        draw_D(); 
        break; 
            
    case 'e': 
        draw_e(); 
        break; 
        
    case 'E': 
        draw_E(); 
        break;     
        
    case 'f': 
        draw_f(); 
        break; 
        
    case 'F': 
        draw_F(); 
        break; 
        
    case 'g': 
        draw_g(); 
        break; 
        
      case 'G': 
        draw_G(); 
        break;     
        
    case 'h': 
        draw_h(); 
        break; 
        
    case 'H': 
        draw_H(); 
        break;     
        
        
    case 'i': 
        draw_i(); 
        break; 
        
    case 'I': 
        draw_I(); 
        break;     
    
        
    case 'j': 
        draw_j(); 
        break; 
        
       case 'J': 
        draw_J(); 
        break;     
        
        
    case 'k': 
        draw_k(); 
        break; 
        
    case 'K': 
        draw_K(); 
        break;      
        
        
    case 'l': 
        draw_l(); 
        break; 
        
     case 'L': 
        draw_L(); 
        break;     
        
    case 'm': 
        draw_m(); 
        break; 
      
      case 'M': 
        draw_M(); 
        break;     
        
    case 'n': 
        draw_n(); 
        break; 
        
        
    case 'N': 
        draw_N(); 
        break; 
          
    case 'o': 
        draw_o(); 
        break; 
                  
    case 'O': 
        draw_O(); 
        break; 
        
    case 'p': 
        draw_p(); 
        break; 
        
       case 'P': 
        draw_P(); 
        break;     
     
    case 'q': 
        draw_q(); 
        break; 
        
    case 'Q': 
        draw_Q(); 
        break; 
        
    case 'r': 
        draw_r(); 
        break; 
        
    case 'R': 
        draw_R(); 
        break;     
     
        
    case 's': 
        draw_s(); 
        break; 
        
    case 'S': 
        draw_S(); 
        break; 
    
        
    case 't': 
        draw_t(); 
        break; 
        
      case 'T': 
        draw_T(); 
        break;     
        
    case 'u': 
        draw_u(); 
        break; 
        
    case 'U': 
        draw_U(); 
        break;     
        
    case 'v': 
        draw_v(); 
        break; 
        
    case 'V': 
        draw_V(); 
        break;     
        
    case 'w': 
        draw_w(); 
        break; 
        
     case 'W': 
        draw_W(); 
        break;     
        
        
    case 'x': 
        draw_x(); 
        break; 
        
    case 'X': 
        draw_X(); 
        break;     
        
    case 'y': 
        draw_y(); 
        break; 
        
    case 'Y': 
        draw_Y(); 
        break; 
        
    case 'z': 
        draw_z(); 
        break; 
        
     case 'Z': 
        draw_Z(); 
        break;     
 
    case '0': 
        draw_0(); 
        break; 
    case '1': 
        draw_1(); 
        break; 
    case '2': 
        draw_2(); 
        break; 
    case '3': 
        draw_3(); 
        break; 
    case '4': 
        draw_4(); 
        break; 
    case '5': 
        draw_5(); 
        break; 
    case '6': 
        draw_6(); 
        break; 
    case '7': 
        draw_7(); 
        break; 
    case '8': 
        draw_8(); 
        break; 
    case '9': 
        draw_9(); 
        break; 
    } 
} 
 
 
 
  void draw_dash () { 
  
        
  

    rLine( 20+Italic , 55 , 60+Italic , 55 ); 

    translate(spacing-8, 0); 
} 
   
 
 
 
 void draw_space () { 
 
    translate(spacing-35, 0); 
} 
 
 
  
 void draw_point () { 
   
   
           
  

  
  
   rLine( 10 , 100 , 30 , 100 ); 
  

 
    translate(spacing-45, 0); 
} 
 
 
  void draw_comma () { 
   
   
           
  

  
   rLine( 13 , 100 , 30 , 100 ); 
   rLine( 30 , 100 , 20 , 115 ); 
  

 
    translate(spacing-45, 0); 
} 
 
 
 
 

 void draw_A () { 
   
        
  

  
  
   rLine( 10 , 100 , 50+Italic*1.45 , 10 ); 
    rLine( 50+Italic*1.45 , 10 , 80 , 100 ); 
     rLine( 0 , 100 , 20 , 100 ); // schreef links
      rLine( 70, 100 , 90 , 100 ); // schreef rechts
    rLine( 28+Italic*0.63 , 60 , 66.5+Italic*0.63, 60 ); // midden balk
 
    translate(spacing+11, 0);
    
   
    } 
 
 
void draw_a () { 
   
      
  




 if (Italic == 20) { 
    
  float y;
    y = 100 - Italic;
  


   rLine( 20 , 100 , 70+ Italic*(100-y)/60 , y  ); 
   rLine( 20+Italic , 40 , 20 , 100 ); 
  
    rLine( 20+Italic , 40 , 70+Italic , 40 ); 
  
  
  rLine( 70+Italic , 40 , 70 , 100 ); 
   rLine( 70 , 100 , 80 , 100 ); 

 translate(spacing+11, 0);
    }




 if (Italic > 20) { 
    
  float y;
    y = 100 - Italic;
  


   rLine( 20 , 100 , 70+ Italic*(100-y)/60 , y  ); 
   rLine( 20+Italic , 40 , 20 , 100 ); 
  
    rLine( 20+Italic , 40 , 70+Italic , 40 ); 
  
  
  rLine( 70+Italic , 40 , 70 , 100 ); 
   rLine( 70 , 100 , 80 , 100 ); 

 translate(spacing+11, 0);
    }

 if (Italic < 20) { 
    
  rLine( 20+Italic , 40 , 70+Italic , 40 ); 
    rLine( 20+Italic/2 , 70 , 70+Italic/2 , 70 ); 
    rLine( 20 , 100 , 80 , 100 ); 
    rLine( 70+Italic , 40 , 70 , 100 ); 
    rLine( 20+Italic/2 , 70 , 20 , 100 ); 

 translate(spacing+11, 0);
    }
    
} 
 
 
 void draw_B () { 
  
       
  
 
   rLine( 0+Italic*1.45 , 10 , 70+Italic*1.45 , 10 ); 
    rLine( 10+Italic*1.45 , 10 , 10 , 100 ); 
    rLine( 70+Italic*1.45 , 10 , 70 , 100 ); 
    rLine( 0 , 100 , 70 , 100 );  
    rLine( 10+Italic*0.83 , 50 , 70+Italic*0.83 , 50 ); 
    translate(spacing+8, 0); 
} 
 
 
void draw_b () { 
  
      
  

  float y;
  
  y = 40 + Italic;
  
    rLine( 20+ Italic*(100-y)/60 , y , 70+Italic , 40 ); 
    rLine( 20 , 100 , 70 , 100 ); 
    rLine( 70+Italic , 40 , 70 , 100 ); 
    rLine( 20+Italic*1.7 , 0 , 20 , 100 ); 
    rLine( 20+Italic*1.7 , 0 , 10+Italic*1.7 , 0 ); 
    translate(spacing+8, 0); 
} 

void draw_C () { 
  
         
  
  
  
    rLine( 20+Italic*1.45 , 10 , 80+Italic*1.45 , 10 ); 
    rLine( 20+Italic*1.45 , 10 , 20 , 100 ); 
    rLine( 20 , 100 , 80 , 100 ); 
    translate(spacing+7, 0); 
    
} 

 
void draw_c () { 
  
   float y;
    y = 100 - Italic;
        


   rLine( 20+Italic , 40 , 70+Italic , 40 ); 
    rLine( 20 , 100 , 70 , 100 ); 
    rLine( 20+Italic , 40 , 20 , 100 ); 
    translate(spacing-8, 0); 
} 
 
void draw_d () { 
  
  
          float y;
    y = 100 - Italic;
  

    rLine( 20+Italic , 40 , 70+Italic , 40 ); 
   rLine( 20 , 100 , 70+ Italic*(100-y)/60 , y  ); //boog u
   
   rLine( 70 , 100 , 80, 100  ); //schreef
   
   
    rLine( 20+Italic , 40 , 20 , 100 );
    rLine( 70+Italic*1.65 , 0 , 70 , 100 ); 
     rLine( 70+Italic*1.65 , 0 , 80+Italic*1.65 , 0 ); 
    
     
     
     
     
   
    translate(spacing+10, 0); 
} 
 
 void draw_D () { 
   
          
  
   
   
   rLine( 0+Italic*1.45 , 10 , 10+Italic*1.45 , 10 ); //bovenschreef
    rLine( 10+Italic*1.45 , 10 , 70+Italic*1.45 , 10 ); //bovenstok
    rLine( 70+Italic*1.45 , 10 , 70 , 100 ); //rechterstok
    rLine( 10 , 100 , 70 , 100 ); //onderstok
     rLine( 0 , 100 , 10 , 100 ); //onverschreef
     rLine( 10+Italic*1.45, 10, 10, 100); // linkderstok
    translate(spacing+7, 0); 
} 

 
 
void draw_e () { 
 
       
  
  
  rLine( 20+Italic , 40 , 70+Italic , 40 ); 
    rLine( 20 , 100 , 70 , 100 ); //onderlijn
    rLine( 20+Italic , 40 , 20 , 100 ); //linkerlijn
     rLine( 70+Italic , 40 , 70+Italic/2 , 70 ); 
      rLine( 20+Italic/2 , 70 , 70+Italic/2 , 70 ); 
    
     translate(spacing+8, 0);  
} 
 
 
 
 
 
 
 void draw_E () { 
   
  
  
   
   
    rLine( 0+Italic*1.45 , 10 , 70+Italic*1.45 , 10 ); 
    rLine( 10+Italic*1.45 , 10 , 10 , 100 ); 
    rLine( 0 , 100 , 70 , 100 );  
    rLine( 10+Italic*0.83 , 50 , 70+Italic*0.83 , 50 ); //middenboog
    translate(spacing-3, 0); 
} 

 
 
void draw_f () { 
  
         
        
  
 
  rLine( 25+Italic*1.5 , 10 , 25 , 100 ); 
    rLine( 25+Italic*1.5 , 10 , 65+Italic*1.5 , 10 ); 
    rLine( 15+Italic , 40 , 45+Italic , 40 );
   rLine( 25 , 100 , 35 , 100 ); 
    translate(spacing-25, 0); 
} 


void draw_F () { 
  
  
  
     
  
    rLine( 0+Italic*1.45 , 10 , 60+Italic*1.45 , 10 ); 
    rLine( 10+Italic*1.45 , 10 , 10 , 100 ); 
    rLine( 0 , 100 , 20 , 100 );  
    rLine( 10+Italic*0.83 , 50 , 40+Italic*0.83 , 50 ); 
    translate(spacing-19, 0); 
} 


 
void draw_g () { 
  
      
  
  
  
    
    float y;
    y = 100 - Italic;
  


   rLine( 20 , 100 , 70+ Italic*(100-y)/60 , y  ); 
   rLine( 20+Italic , 40 , 20 , 100 ); 
  
    rLine( 20+Italic , 40 , 70+Italic , 40 ); 
  
  
    rLine( 70+Italic , 40 , 70-Italic/2.1 , 130 ); 
       rLine( 20-Italic/2.1 , 130 , 70-Italic/2.1 , 130 );

 translate(spacing+11, 0);
    }
  
  
 
 
 
  void draw_G () { 
    
  
      
    
   rLine( 10+Italic*1.45 , 10 , 70+Italic*1.45 , 10 ); 
    rLine( 10+Italic*1.45 , 10 , 10 , 100 ); 
    rLine( 10 , 100 , 70 , 100 ); 
    rLine( 70 , 100 , 70+Italic*0.69 , 60 ); 
    rLine( 70+Italic*0.69 , 60 , 40+Italic*0.69 , 60 );
    
    translate(spacing+8, 0); 
} 
 
 
 
 
void draw_h () { 
    
    
 
  _n_helper(true);
  rLine( 10+Italic*1.7 , 0 , 20+Italic*1.7 , 0 ); // top serif
    rLine( 20+Italic*1.7 , 0 , 20 , 100 ); 

//    rLine( 20+Italic , 40 , 70+Italic , 40 ); 
//    rLine( 70+Italic , 40 , 70 , 100 ); 
//    rLine( 20 , 100 , 30 , 100 ); 
//    rLine( 70 , 100 , 80 , 100 ); 
    translate(spacing+9, 0); 
} 




void draw_H () { 
  
      
    
  
    rLine( 0+Italic*1.45 , 10 , 20+Italic*1.45 , 10 ); // schreef links
    rLine( 60+Italic*1.45 , 10 , 80+Italic*1.45 , 10 ); //schreef rechts
    
     rLine( 10+Italic*1.45 , 10 , 10 , 100 ); 
      rLine( 70+Italic*1.45 , 10 , 70 , 100 ); 
      
      rLine( 10+Italic*0.83 , 50 , 70+Italic*0.83 , 50 ); //middenbalk
    
       rLine( 0 , 100 , 20 , 100 ); 
    rLine( 60 , 100 , 80 , 100 ); 
  
    translate(spacing+9, 0); 
} 



 
void draw_i () { 
  
  
     
    


   rLine( 10+Italic , 40 , 20+Italic , 40 ); 
   rLine( 15+Italic*1.3 , 15 , 25+Italic*1.3 , 15 ); // punt
   rLine( 20 , 100 , 30 , 100 ); 
   rLine( 20+Italic , 40 , 20 , 100 ); 
   
    //  fill(0);  
//quad(10, 50+range, 10+range2+range3, 40, 20+range2, 40, 20+range3, 50+range); 

     translate(spacing-40, 0); 
} 
 
 
 
 
 void draw_I () { 
  
      
    
  
    rLine( 0+Italic*1.45 , 10 , 20+Italic*1.45 , 10 ); // schreef boven
  rLine( 10+Italic*1.45 , 10 , 10 , 100 ); 
  
       rLine( 0 , 100 , 20 , 100 ); 
 
  
    translate(spacing-44, 0); 
} 

 
 
 
void draw_j () { 
  
     
  

    rLine( 10+Italic*1.2 , 40 , 20+Italic*1.2 , 40 ); 
    rLine( 15+Italic*1.3 , 15 , 25+Italic*1.3 , 15 ); // punt
   rLine( 20+Italic*1.2 , 40 , 20-Italic/3 , 130 ); 
     rLine( -10-Italic/3 , 130 , 20-Italic/3 , 130 ); 
    translate(spacing-40, 0); 
} 


void draw_J () { 
  
  
       
  

    rLine( 60+Italic*1.45  , 10 , 80+Italic*1.45  , 10 ); 
    rLine( 70+Italic*1.45  , 10 , 70 , 100 ); // punt
   rLine( 70 , 100 , 20 , 100 ); 
    translate(spacing+10, 0); 
} 


 
void draw_k () { 
   
       
  
 
  rLine( 10+Italic*1.6 , 0 , 20+Italic*1.6 , 0 ); 
    rLine( 20+Italic*1.6 , 0 , 20 , 100 ); 
 rLine( 30 , 100 , 20 , 100 ); //onderschreef
 rLine( 20+Italic/1.57 , 60 , 63+Italic , 40 ); 
 rLine( 20+Italic/1.57 , 60 , 70 , 100 );
rLine( 80 , 100 , 70 , 100 );    
rLine( 50+Italic , 40 , 63+Italic , 40 ); //schreef midden
    
     translate(spacing-2, 0); 

} 


 void draw_K () { 
   
         
  
   
    rLine( 0+Italic*1.45 , 10 , 20+Italic*1.45 , 10 ); 
    rLine( 50+Italic*1.45 , 10 , 70+Italic*1.45 , 10 ); 
    rLine( 10+Italic*1.45 , 10 , 10 , 100 );
    rLine( 10+Italic*0.5 , 70 , 60+Italic*1.45 , 10 ); 
    rLine( 30+Italic*0.87 , 47 , 70 , 100 ); 
    rLine( 60 , 100 , 80 , 100 );
   rLine( 0 , 100 , 20 , 100 ); 
    
   
     translate(spacing-2, 0); 

} 
 

 
void draw_l () { 
   
      
  
  
  rLine( 10+Italic*1.6 , 0 , 20+Italic*1.6 , 0 ); 
    rLine( 20+Italic*1.6 , 0 , 20 , 100 ); 
   rLine( 30 , 100 , 20 , 100 ); 
    translate(spacing-40, 0); 
} 
 

void draw_L () { 
  
           
  
  
     rLine( 0+Italic*1.45 , 10 , 20+Italic*1.45 , 10 ); 
    rLine( 10+Italic*1.45 , 10 , 10 , 100 ); 
    rLine( 10 , 100 , 60 , 100 ); 

    translate(spacing-17, 0); 
}  
 
 
 
 
void draw_m () { 
    
    
  
//  rLine( 10+Italic , 40 , 120+Italic , 40 ); // first boog
  rLine( 10+Italic , 40 , 20+Italic , 40 ); // serif top left
  rLine( 20+Italic , 40 , 20 , 100 );  // stem 1
  
  _n_helper(false);
  translate(50, 0);
  _n_helper(true);
//  rLine( 20 , 100 , 30 , 100 );   // serif bottom left
//  rLine( 70+Italic , 40 , 70 , 100 ); // stem 2
//  rLine( 70 , 100 , 80 , 100 );  // middle serif
//  rLine( 120+Italic , 40 , 120 , 100 );  // stem 3
//  rLine( 120 , 100 , 130 , 100 );
  translate(spacing+10, 0); 
} 



void draw_M () { 

      
    
  
 
    rLine( 0+Italic*1.45 , 10 , 20+Italic*1.45 , 10 );
    
    rLine( 10+Italic*1.45 , 10 , 55+Italic/6 , 100 );
    
    rLine( 10+Italic*1.45 , 10 , 10 , 100 );
   
    rLine( 100+Italic*1.45 , 10 , 55+Italic/6 , 100 );
   
    rLine( 90+Italic*1.45 , 10 , 110+Italic*1.45 , 10 );
   
    rLine( 90, 100 , 110 , 100 );

     rLine( 100+Italic*1.45, 10 , 100 , 100 );

    rLine( 0 , 100 , 20 , 100 );
    
    translate(spacing+33, 0); 
} 


void _n_helper(boolean finalSerif) {
    
  float y;
  
  y = 40 + Italic;
  rLine( 20+ Italic*(100-y)/60, y , 70+Italic , 40 ); //boog n
  rLine( 70+Italic , 40 , 70 , 100 );
  if (finalSerif) {
    rLine( 70 , 100 , 80 , 100 ); 
  }
  if (Italic < 20) { 
    rLine( 20 , 100 , 30-Italic/2 , 100 );
  }
}
 
void draw_n () { 
    
    
  
  _n_helper(true);  
  
  rLine( 10+Italic , 40 , 20+Italic , 40 );
  rLine( 20+Italic , 40 , 20 , 100 );
  translate(spacing+13, 0); 
} 


void draw_N () { 
      
    
  
    rLine( 0+Italic*1.45 , 10 , 20+Italic*1.45 , 10 );
    rLine( 10+Italic*1.45 , 10 , 70 , 100 );
    rLine( 10+Italic*1.45 , 10 , 10 , 100 );
    rLine( 70+Italic*1.45 , 10 , 70 , 100 );
    rLine( 60+Italic*1.45 , 10 , 80+Italic*1.45 , 10 );
    rLine( 0 , 100 , 20 , 100 );

    translate(spacing+13, 0); 
} 


 
void draw_o () { 
  
            
  
 
    rLine( 20+Italic , 40 , 70+Italic , 40 ); 
    rLine( 20 , 100 , 70 , 100 );
rLine( 20+Italic , 40 , 20 , 100 );
    rLine( 70+Italic , 40 , 70 , 100 );
    translate(spacing+10, 0);  
} 


 void draw_O () { 
   
    
  
  
   
    rLine( 10 , 100 , 70 , 100 ); //onderboog
    rLine( 10+Italic*1.45 , 10 , 70+Italic*1.45 , 10 ); 
    rLine( 10+Italic*1.45 , 10 , 10 , 100 );
    rLine( 70+Italic*1.45 , 10 , 70 , 100 );
    translate(spacing+10, 0);  
} 





 
void draw_p () { 
     
  
  
  
  
  
  float y;
  
  y = 40 + Italic;
  
    rLine( 20+ Italic*(100-y)/60 , y , 70+Italic , 40 ); 
    rLine( 20 , 100 , 70 , 100 ); 
    rLine( 70+Italic , 40 , 70 , 100 ); 

    rLine( 20+Italic , 40 , 10+Italic , 40 ); 


    

    
    rLine( 20+Italic , 40 , 20-Italic/2 , 130 ); //stok links
    

   
    rLine( 10-Italic/2 , 130 , 30-Italic/2 , 130 ); //onderschreef p
   translate(spacing+12, 0);     
} 
 
 
 
  void draw_P () { 
    
  
      
    
    rLine( 0+Italic*1.45 , 10 , 20+Italic*1.45 , 10 ); 
    rLine( 20+Italic*1.45 , 10 , 70+Italic*1.45 , 10 ); 
    rLine( 10+Italic*1.45 , 10 , 10 , 100 ); 
 rLine( 70+Italic*1.45 , 10 , 70+Italic*0.65 , 60 ); 

 rLine( 10+Italic*0.65 , 60 , 70+Italic*0.65 , 60 ); 
 rLine( 0 , 100 , 30 , 100 ); 

    translate(spacing+12, 0);     
} 
 
 
 
 
void draw_q () { 
  
  
    
  

  
    rLine( 70+Italic , 40 , 70-Italic/2.2 , 130 );  // lange stok
   
    rLine( 70+Italic , 40 , 80+Italic , 40 );  
  
   rLine( 20+Italic , 40 , 70+Italic , 40 ); 
    
     rLine( 20 , 100 , 70 , 100 );
     
     rLine( 20+Italic , 40 , 20 , 100 );   // stok links
     
     rLine( 70-Italic/2.2 , 130 , 80-Italic/2.2 , 130 ); //onderschreef

translate(spacing+5, 0); 

} 
 void draw_Q () { 
   
  
         
   
   rLine( 10 , 100 , 70 , 100 ); //onderboog
   rLine( 10+Italic*1.45 , 10 , 70+Italic*1.45 , 10 ); //bovenboog
   rLine( 10+Italic*1.45 , 10 , 10 , 100 ); //linkerdeel
    rLine( 70+Italic*1.45 , 10 , 70 , 100 );//rechterdeel
    rLine( 30, 85, 60, 116 ) ;
    
    
    translate(spacing+10, 0);  
} 



 
void draw_r () { 
  
    
  
  
  
    rLine( 20+Italic/1.21 , 50 , 30+Italic , 40 ); 
    rLine( 20+Italic , 40 , 20 , 100 ); 
    rLine( 10+Italic , 40 , 20+Italic , 40 ); 
    rLine( 30+Italic , 40 , 55+Italic , 40 ); 
    rLine( 10 , 100 , 30 , 100 ); //schreef onder

    translate(spacing-25, 0); 
} 



void draw_R () { 
  
      
  
  
     rLine( 0+Italic*1.45 , 10 , 10+Italic*1.45 , 10 ); 
     rLine( 10+Italic*1.45 , 10 , 70+Italic*1.45 , 10 ); 
     rLine( 10+Italic*1.45 , 10 , 10 , 100 ); 
     rLine( 70+Italic*1.45 , 10 , 70+Italic*0.83 , 50 );

     rLine( 50+Italic*0.83 , 50 , 70+Italic*0.31 , 80 );

 
  rLine( 70+Italic*0.31, 80, 70, 100 );
 rLine( 10+Italic*0.83 , 50 , 70+Italic*0.83 , 50 ); 
 rLine( 0 , 100 , 30 , 100 ); 

 rLine( 60 , 100 , 80 , 100 ); 
 translate(spacing-0, 0); 
} 




 
void draw_s () { 
 

    
  


  rLine( 20+Italic , 40 , 70+Italic , 40 ); 
    rLine( 20+Italic/2 , 70 , 70+Italic/2 , 70 ); 
    rLine( 20 , 100 , 70 , 100 ); 
    rLine( 20+Italic , 40 , 20+Italic/2 , 70 ); 
    rLine( 70+Italic/2 , 70 , 70 , 100 ); 
   
    translate(spacing+5, 0); 
} 


void draw_S () { 
  
      
  
  
    rLine( 10+Italic*1.45 , 10 , 70+Italic*1.45 , 10 ); 
    rLine( 10+Italic*1.45 , 10 , 10+Italic*0.80 , 50 ); 
    rLine( 10+Italic*0.80, 50 , 70+Italic*0.83 , 50 ); 
    rLine( 70+Italic*0.83 , 50 , 70 , 100 ); 
    rLine( 70 , 100 , 10 , 100 ); 
   
    translate(spacing+5, 0); 
} 



void draw_t () { 
 
    
  

  rLine( 10+Italic*1.4 , 20 , 20+Italic*1.4 , 20 ); 
    rLine( 10+Italic , 40 , 40+Italic , 40 ); 
     rLine( 20 , 100 , 60 , 100 ); 
      rLine( 20 , 100 , 20+Italic*1.4 , 20 ); 
    translate(spacing-23, 0); 
} 


void draw_T () { 
  
    
    
  
  
    rLine( 0+Italic*1.45 , 10 , 80+Italic*1.45 , 10 ); 
    rLine( 40+Italic*1.45 , 10 , 40 , 100 ); 
     rLine( 30 , 100 , 50 , 100 ); 

    translate(spacing-10, 0); 
} 


 
void draw_u () { 

    
  
  float y;
    y = 100 - Italic;
  

  rLine( 10+Italic , 40 , 20+Italic , 40 ); 
   rLine( 20 , 100 , 70+ Italic*(100-y)/60 , y  ); //boog u
   rLine( 20+Italic , 40 , 20 , 100 ); 
  
  if (Italic < 20) { 
  
   rLine( 60+Italic+Italic/2 , 40 , 70+Italic , 40 );
   
  }
  
  
  rLine( 70+Italic , 40 , 70 , 100 ); 
   rLine( 70 , 100 , 80 , 100 ); 
    translate(spacing+10, 0); 
} 


  void draw_U () { 
    
      
    
    
   rLine( 10 , 100 , 70 , 100 ); //lage boog
   rLine( 0+Italic*1.45 , 10 , 20+Italic*1.45 , 10 );  //linker schreef
   rLine( 60+Italic*1.45 , 10 , 80+Italic*1.45 , 10 ); // dit is dan de rechter :D
rLine( 10+Italic*1.45 , 10 , 10 , 100 );
    rLine( 70+Italic*1.45 , 10 , 70 , 100 );
    translate(spacing+10, 0);  
} 
 


 
void draw_v () { 
          
    
  
  
 
     rLine( 10+Italic , 40 , 20+Italic , 40 ); 
   rLine( 20+Italic , 40 , 45 , 100 ); 
   rLine( 60+Italic , 40 , 70+Italic , 40 );
   rLine( 70+Italic , 40 , 45 , 100 ); 
   
    translate(spacing+1, 0); 
} 



void draw_V () { 
  
     
  
  
  
     rLine( 0+Italic*1.45 , 10 , 20+Italic*1.45 , 10 ); //linkerschreef
     rLine( 60+Italic*1.45 , 10 , 80+Italic*1.45 , 10 ); //rechterschreef
   rLine( 10+Italic*1.45 , 10 , 40 , 100 ); //linkerstok
   rLine( 40 , 100 , 70+Italic*1.45 , 10 ); //rechterstok
   
    translate(spacing+1, 0); 
} 



 
void draw_w () { 
  
  
  
  
     rLine( 10+Italic , 40 , 20+Italic , 40 ); 
   rLine( 20+Italic , 40 , 45 , 100 ); 
   rLine( 60+Italic , 40 , 70+Italic , 40 );
   rLine( 70+Italic , 40 , 45 , 100 ); 
    rLine( 70+Italic , 40 , 95 , 100 ); 
    rLine( 120+Italic , 40 , 95 , 100 ); 
      rLine( 110+Italic , 40 , 120+Italic , 40 ); 
     
    translate(spacing+43, 0); 
} 
 
 
 void draw_W () { 
   
  
  
   
     rLine( 0+Italic*1.45 , 10 , 20+Italic*1.45 , 10 ); //linkerschreef
     rLine( 60+Italic*1.45 , 10 , 80+Italic*1.45 , 10 );  //middenschreef
      rLine( 120+Italic*1.45 , 10 , 140+Italic*1.45 , 10 ); //rechterschreef
      
   rLine( 10+Italic*1.45 , 10 , 40 , 100 );
   rLine( 40 , 100 , 70+Italic*1.45 , 10 );
    rLine( 70+Italic*1.45 , 10 , 100 , 100 ); 
    
     rLine( 100 , 100 , 130+Italic*1.45 , 10 ); 
   
    translate(spacing+43, 0); 
} 

 
 
void draw_x () { 
  

    
  


  rLine( 70+Italic , 40 , 20 , 100 ); 
    rLine( 20+Italic , 40 , 70 , 100 ); 
    rLine( 10+Italic , 40 , 20+Italic , 40 ); 
    rLine( 10 , 100 , 20 , 100 ); 
    rLine( 60+Italic , 40 , 70+Italic , 40 ); 
    rLine( 60 , 100 , 70 , 100 );         
        
    translate(spacing, 0); 
} 



void draw_X () { 
  
    
    
  
    rLine( 0+Italic*1.45 , 10 , 20+Italic*1.45 , 10 ); //linkerschreefboven
    rLine( 60+Italic*1.45 , 10 , 80+Italic*1.45 , 10 ); //rechterschreefboven
     rLine( 0 , 100 , 20 , 100 ); 
    rLine( 60 , 100 , 80 , 100 ); 
    rLine( 10+Italic*1.45  , 10 , 70 , 100 ); 
    rLine( 70+Italic*1.45  , 10 , 10 , 100 );         
        
    translate(spacing, 0); 
} 



 
void draw_y () { 

  
        
  
  
  
      rLine( 10+Italic , 40 , 20+Italic , 40 ); 
     
      rLine( 60+Italic , 40 , 70+Italic , 40 ); 
      
         rLine( 20+Italic , 40 , 43 , 100 ); 
      
     
     
      rLine( 70+Italic , 40 , 30-Italic/1.9 , 130 ); 
     
      translate(spacing, 0); 
} 
 
 
 
  void draw_Y () { 

    
   

     rLine( 0+Italic*1.45 , 10 , 20+Italic*1.45 , 10 ); //schreeflinksboven
     
     rLine( 60+Italic*1.45 , 10 , 80+Italic*1.45 , 10 ); //schreef rechtsboven
      
     rLine( 10+Italic*1.45 , 10 , 40+Italic*0.65 , 60 ); //linkerdiagonaal
      
     rLine( 40+Italic*0.65 , 60 , 70+Italic*1.45 , 10 ); //rechterdiagonaal
    
     rLine( 40+Italic*0.65 , 60 , 40 , 100 ); 
     
     rLine( 30 , 100 , 50 , 100 );
     
      translate(spacing-7, 0); 
} 
 
 
void draw_z () { 
  
    
  
  
 
    rLine( 20+Italic/1.2 , 40 , 70+Italic/1.2 , 40 ); 
    rLine( 70+Italic/1.2 , 40 , 20 , 100 ); 
    rLine( 20 , 100 , 70 , 100 ); 
    translate(spacing, 0); 
} 
 
 
 
 void draw_Z () { 
   
     
  

    rLine( 10+Italic*1.45 , 10 , 80+Italic*1.45 , 10 ); 
    rLine( 80+Italic*1.45 , 10 , 10 , 100 ); 
    rLine( 10 , 100 , 80 , 100 ); 
    translate(spacing, 0); 
} 
 
 
 
 
 
 
void draw_0 () { 
    rLine( 45 , 72 , 0 , 72 ); 
    rLine( 0 , 72 , 0 , 0 ); 
    rLine( 0 , 0 , 45 , 0 ); 
    rLine( 45 , 0 , 45 , 72 ); 
    translate(spacing, 0); 
} 
 
void draw_1 () { 
    rLine( 19 , 72 , 49 , 72 ); 
    rLine( 0 , 13 , 34 , 0 ); 
    rLine( 34 , 1 , 34 , 72 ); 
    translate(spacing, 0); 
} 
 
void draw_2 () { 
    rLine( 3 , 0 , 29 , 0 ); 
    rLine( 29 , 0 , 44 , 20 ); 
    rLine( 44 , 20 , 0 , 72 ); 
    rLine( 0 , 72 , 45 , 72 ); 
    translate(spacing, 0); 
} 
 
void draw_3 () { 
    rLine( 3 , 0 , 28 , 0 ); 
    rLine( 28 , 0 , 40 , 17 ); 
    rLine( 40 , 17 , 28 , 34 ); 
    rLine( 28 , 34 , 45 , 51 ); 
    rLine( 45 , 51 , 31 , 72 ); 
    rLine( 31 , 72 , 0 , 72 ); 
    translate(spacing, 0); 
} 
 
void draw_4 () { 
    rLine( 50 , 50 , 0 , 50 ); 
    rLine( 0 , 50 , 40 , 0 ); 
    rLine( 40 , 0 , 40 , 72 ); 
    translate(spacing, 0); 
} 
 
void draw_5 () { 
    rLine( 0 , 72 , 26 , 72 ); 
    rLine( 26 , 72 , 38 , 51 ); 
    rLine( 38 , 51 , 24 , 34 ); 
    rLine( 24 , 34 , 0 , 34 ); 
    rLine( 0 , 34 , 0 , 0 ); 
    rLine( 0 , 0 , 33 , 0 ); 
    translate(spacing, 0); 
} 
 
void draw_6 () { 
    rLine( 0 , 33 , 35 , 37 ); 
    rLine( 35 , 37 , 35 , 72 ); 
    rLine( 35 , 72 , 0 , 72 ); 
    rLine( 0 , 72 , 0 , 33 ); 
    rLine( 0 , 33 , 20 , 0 ); 
    translate(spacing, 0); 
} 
 
void draw_7 () { 
    rLine( 0 , 0 , 41 , 0 ); 
    rLine( 41 , 0 , 15 , 72 ); 
    translate(spacing, 0); 
} 
 
void draw_8 () { 
  
    bezier(2 , 3, 41 , 23 ,11 ,12 ,19 ,5);
        
    translate(spacing, 0); 
} 
 
void draw_9 () { 
    rLine( 20 , 10 , 70 , 10 ); 
    rLine( 70 , 10 , 70 , 70 ); 
    rLine( 20 , 40 , 70 , 40 ); 
    rLine( 20 , 40 , 20 , 70 ); 
    rLine( 20 , 70 , 80 , 70 );

    translate(spacing, 0); 
} 
 
void draw_enter () { 

    translate(-1190, 178); 
}



