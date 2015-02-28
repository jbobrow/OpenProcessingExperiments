
/* Shirley Wang
   sijiaw@andrew.cmu.edu
   
   Homework 2
   
       copyright Shirley Wang 2013*/
       


size ( 400, 400);
smooth ( );
background ( #70F4F7 );

float  x, y, wd, ht;

  x = 100;
  y = 100;
  wd = 100;
  ht = 100;
  
/* body */

noStroke ( );
fill ( 255, 132, 0);
ellipse ( x + wd, y + 3 * ht, 3 * wd, 3.5 * ht);
  
    /* left collar */
    noStroke ( ) ;
    fill ( 250, 153, 48 );
    triangle ( x + 1.5 * wd, y +  ht, x + .8 * wd, y + 1.7 * ht, x + .4 * wd, y + 1.4 * ht);

    /* right collar */
    noStroke ( ) ;
    fill ( 250, 153, 48 );
    triangle ( x + .5 * wd, y +  ht, x + 1.2 * wd, y + 1.7 * ht, x + 1.6 * wd, y + 1.4 * ht);
    
    
/* face */

noStroke ( );
fill ( 222, 204, 177 );
ellipse ( x + wd, y + .7 * wd, 1.6 * wd, 1.6 * ht);

     /* ears*/
     noStroke ( );
     fill ( 222, 204, 177 );
     ellipse ( x + 1.8 * wd, y + .7 * wd, .3 * wd, .32 * ht);
     ellipse ( x +  .2 * wd, y + .7 * wd, .3 * wd, .32 * ht);


/* W */

    strokeWeight ( 6 );
    stroke ( 185, 170, 155);
    noFill ( );
    
    
    beginShape ( );
      curveTightness ( - 1.3 );
        curveVertex ( x +       wd, .8 * y      );     /* reference */
        
        curveVertex ( x +  .4 * wd, y +  .2 * ht);
        curveVertex ( x +  .5 * wd, y + 1.3 * ht);
        curveVertex ( x +       wd, y +  .6 * ht);    /* reference */
       
    endShape ( ); 
    
    beginShape ( );   
      curveTightness ( 1.0);
        curveVertex ( x +  .4 * wd, y +  .2 * ht);    /* reference */
        curveVertex ( x +  .5 * wd, y + 1.3 * ht);
        curveVertex ( x +       wd, y +  .6 * ht);
        curveVertex ( x + 1.5 * wd, y + 1.3 * ht);
        curveVertex ( x + 1.6 * wd, y +  .2 * ht);    /* reference */
        
    endShape ( );
    
    beginShape ( );
      curveTightness ( -1.3 );
        curveVertex ( x +       wd, y +  .6 * ht);    /* reference */
        curveVertex ( x + 1.5 * wd, y + 1.3 * ht);
        curveVertex ( x + 1.6 * wd, y +  .2 * ht);
        curveVertex ( x +       wd, .8 * y      );    /* reference */
        
    endShape ( );
      

/* moustache */
    
    strokeWeight ( 3 );
    stroke ( 235, 247, 247 );
    
    curveTightness ( 1.0 );
    
      beginShape ( );
      
        curveVertex ( x +  .5  * wd, y + 1.15 * ht);    /* reference */
        
        curveVertex ( x +  .56 * wd, y + 1.25 * ht);
        curveVertex ( x +  .62 * wd, y + 1.15 * ht);
        curveVertex ( x +  .68 * wd, y + 1.28 * ht);
        curveVertex ( x +  .74 * wd, y + 1.13 * ht);
        curveVertex ( x +  .8  * wd, y + 1.3  * ht);
        curveVertex ( x +  .86 * wd, y + 1.1  * ht);
        curveVertex ( x +  .92 * wd, y + 1.3  * ht);
        curveVertex ( x +  .98 * wd, y + 1.1  * ht);
        curveVertex ( x + 1.04 * wd, y + 1.3  * ht);
        curveVertex ( x + 1.10 * wd, y + 1.1  * ht);
        curveVertex ( x + 1.16 * wd, y + 1.3  * ht);
        curveVertex ( x + 1.22 * wd, y + 1.13 * ht);
        curveVertex ( x + 1.28 * wd, y + 1.28 * ht);
        curveVertex ( x + 1.34 * wd, y + 1.15 * ht);
        curveVertex ( x + 1.40 * wd, y + 1.25 * ht);
        
        curveVertex ( x + 1.46 * wd, y + 1.15 * ht);    /* reference */
        
       endShape ( );
       
      
       
/* nostrils */

fill ( 113, 110, 102);
noStroke ( );

  /* left */
  ellipse ( x +  .9 * wd, y +   ht, 10, 5);
  
  /* right */
  ellipse ( x + 1.1 * wd, y +   ht, 10, 5);
  


/* glasses */

  /* frame */  
  stroke ( 113, 103, 61);
  strokeWeight ( 1.5 );
  fill ( 234, 217, 197 );
  
    /* left */
    ellipse ( x +  .68 * wd, y + .65 * ht, .5 * wd, .5 * ht);
    
    /* right */
    ellipse ( x + 1.32 * wd, y + .65 * ht, .5 * wd, .5 * ht);
  

/* eyes */

noStroke ( );

  /* left */
  fill ( 113, 110, 102);
  ellipse ( x +  .68 * wd, y + .65 * ht, 14, 10);
  
      /* happy eyes */
      fill ( 234, 217, 197);
      ellipse ( x +  .68 * wd, y + .69 * ht, 10, 10);
  
  /* right */
  fill ( 113, 110, 102);
  ellipse ( x + 1.32 * wd, y + .65 * ht, 14, 10);
      
      /* happy eyes */
      fill ( 234, 217, 197);
      ellipse ( x + 1.32 * wd, y + .69 * ht, 10, 10);
  
  

/* eyebrows */
    
    
  /* left eyebrow */
  
  strokeWeight ( 2 );
  stroke ( 235, 247, 247);
  
    beginShape ( );
    curveTightness ( 1.0 );
    
      curveVertex ( x + .9  * wd, y + .35 * ht);    /* reference */
      
      curveVertex ( x + .85 * wd, y + .46 * ht);
      curveVertex ( x + .80 * wd, y + .35 * ht);
      curveVertex ( x + .75 * wd, y + .46 * ht);
      curveVertex ( x + .70 * wd, y + .37 * ht);
      curveVertex ( x + .65 * wd, y + .47 * ht);
      curveVertex ( x + .60 * wd, y + .39 * ht);
      curveVertex ( x + .55 * wd, y + .48 * ht);
      curveVertex ( x + .50 * wd, y + .41 * ht);
      curveVertex ( x + .45 * wd, y + .49 * ht);
      
      curveVertex ( x + .40 * wd, y + .43 * ht);    /* reference */
      
    endShape ( );


  /* right eyebrow */
  strokeWeight ( 2 );
  stroke ( 235, 247, 247);
  
    beginShape ( );
    curveTightness ( 1.0 );

      curveVertex ( x + 1.10 * wd, y + .35 * ht);    /* reference */
      
      curveVertex ( x + 1.15 * wd, y + .46 * ht);
      curveVertex ( x + 1.20 * wd, y + .35 * ht);
      curveVertex ( x + 1.25 * wd, y + .46 * ht);
      curveVertex ( x + 1.30 * wd, y + .37 * ht);
      curveVertex ( x + 1.35 * wd, y + .47 * ht);
      curveVertex ( x + 1.40 * wd, y + .39 * ht);
      curveVertex ( x + 1.45 * wd, y + .48 * ht);
      curveVertex ( x + 1.50 * wd, y + .41 * ht);
      curveVertex ( x + 1.55 * wd, y + .50 * ht);
 
      curveVertex ( x + 1.60 * wd, y + .43 * ht);    /* reference */
      
     endShape ( );
      

/* saveFrame ("hw2.jpg"); */
    

