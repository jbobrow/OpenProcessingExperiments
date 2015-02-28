
void crazyBezier(){  // brushActive 0
    stroke(random(255), 64);
    fill(random(255), 16);
    bezier(memMouse[0]+ nowMouse[1] - memMouse[2] + nowMouse[3], 
            memMouse[1] + nowMouse[1] - nowMouse[1] + memMouse[3], 
            memMouse[rand4()], 
            memMouse[3], 
            nowMouse[rand4()], 
            nowMouse[1], 
            nowMouse[rand4()], 
            nowMouse[3] );
}

void lessCrazyBezier(){ // brushActive 1
    stroke(random(255), 16);
    fill(random(255), 16);
    bezier(memMouse[ rand4()],
            memMouse[rand4()], 
            memMouse[rand4()], 
            memMouse[3], 
            nowMouse[rand4()], 
            nowMouse[1], 
            nowMouse[rand4()], 
            nowMouse[3] );
}

void lessCrazyBezier2(){ // brushActive 2
    stroke(random(255),random(255),random(255), 16);
    fill(random(255), 16);
     bezier(memMouse[0] + int(random(-middle, middle)),        //coordinates for the first anchor point
            memMouse[1] + int(random(-middle, middle)), 
            memMouse[2] + int(random(-10, 10)), // coordinates for the first control point
            memMouse[3] + int(random(-10, 10)), 
            nowMouse[0] + int(random(-10, 10)), // coordinates for the second control point
            nowMouse[1] + int(random(-10, 10)), 
            nowMouse[2] + int(random(-10, 10)), // coordinates for the second anchor point
            nowMouse[3] + int(random(-10, 10)) );
}

void bezEraser(){ // brushActive 3
    stroke(random(200, 255),random(200, 255),random(200, 255), 16);
    // fill(random(230, 255), 64);
     fill(255, int(random(16,64)));
     bezier(memMouse[0] + int(random(-big, big)),        //coordinates for the first anchor point
            memMouse[1] + int(random(-big, big)), 
            memMouse[2] + int(random(-big, big)), // coordinates for the first control point
            memMouse[3] + int(random(-big, big)), 
            nowMouse[0] + int(random(-big, big)), // coordinates for the second control point
            nowMouse[1] + int(random(-big, big)), 
            nowMouse[2] + int(random(-big, big)), // coordinates for the second anchor point
            nowMouse[3] + int(random(-big, big)) );
    curve(nowMouse[1],memMouse[2],memMouse[0],  nowMouse[3], nowMouse[2],memMouse[3],memMouse[1],  nowMouse[0]);
}

void originalBezier(){ // brushActive 4
    stroke(random(255), 64);
    fill(255, int(random(16,24)));
    bezier( memMouse[0],        //coordinates for the first anchor point
            memMouse[1], 
            memMouse[2], // coordinates for the first control point
            memMouse[3], 
            nowMouse[0], // coordinates for the second control point
            nowMouse[1], 
            nowMouse[2], // coordinates for the second anchor point
            nowMouse[3] );
}

void thenBezier(){  // not a brush, an event
    stroke((r255()), int(random(16)));
    fill(r255(), int(random(16)));
    bezier( thenMouse[0] + memMouse[0] + int(random(-big, big)) ,        //coordinates for the first anchor point
            thenMouse[1] + rangeRand(memMouse[3]) + rangeRand(big), 
            thenMouse[2] + rangeRand(memMouse[1]) + rangeRand(big), // coordinates for the first control point
            thenMouse[3] + rangeRand(memMouse[2]) + rangeRand(big), 
            nowMouse[0], // coordinates for the second control point
            nowMouse[1], 
            nowMouse[2], // coordinates for the second anchor point
            nowMouse[3] );
    bezier( thenMouse[0] - memMouse[0] - rangeRand(big) ,        //coordinates for the first anchor point
            thenMouse[1] - rangeRand(memMouse[1]) - rangeRand(big), 
            thenMouse[2] - rangeRand(memMouse[2]) - rangeRand(big), // coordinates for the first control point
            thenMouse[3] - rangeRand(memMouse[3]) - rangeRand(big), 
            nowMouse[3], // coordinates for the second control point
            nowMouse[2], 
            nowMouse[1], // coordinates for the second anchor point
            nowMouse[0] );     
            
    stroke((r255()), (r255()), (r255()), int(random(16)));
    fill(r255(), int(random(16)));      
    
    bezier( thenMouse[0] + rangeRand(memMouse[0]) + rangeRand(middle) ,        //coordinates for the first anchor point
            thenMouse[1] + rangeRand(memMouse[3]) + rangeRand(middle), 
            thenMouse[2] + rangeRand(memMouse[1]) + rangeRand(middle), // coordinates for the first control point
            thenMouse[3] + rangeRand(memMouse[2]) + rangeRand(middle), 
            nowMouse[0], // coordinates for the second control point
            nowMouse[1], 
            nowMouse[2], // coordinates for the second anchor point
            nowMouse[3] );
    bezier( thenMouse[0] - rangeRand(memMouse[0]) - rangeRand(middle) ,        //coordinates for the first anchor point
            thenMouse[1] - rangeRand(memMouse[1]) - rangeRand(middle), 
            thenMouse[2] - rangeRand(memMouse[2]) - rangeRand(middle), // coordinates for the first control point
            thenMouse[3] - rangeRand(memMouse[3]) - rangeRand(middle), 
            nowMouse[3], // coordinates for the second control point
            nowMouse[2], 
            nowMouse[1], // coordinates for the second anchor point
            nowMouse[0] );              
}

void mouseMoved() {
   
    stroke(random(200, 225));  
  
     if (brushActive[0] == true){
       
       crazyBezier();
       bezEraser();
       lessCrazyBezier2();
       bezEraser();
       lessCrazyBezier2();
       bezEraser();
     }
     if (brushActive[1] == true){
       lessCrazyBezier();
     }
     if (brushActive[2] == true){
       lessCrazyBezier2();
        lessCrazyBezier2();
         lessCrazyBezier2();
          lessCrazyBezier2();
           lessCrazyBezier2();
            lessCrazyBezier2();
     }  
     if (brushActive[3] == true){
       bezEraser();
     }
     if (brushActive[4] == true){
       originalBezier();
       bezEraser();
     }  


            
    
    curve(memMouse[0], memMouse[1], memMouse[2], memMouse[3], nowMouse[0], nowMouse[1], nowMouse[2], nowMouse[3] );
    
    stroke(random(255), 64);
    curve(memMouse[3], memMouse[2], memMouse[1], memMouse[0], nowMouse[3], nowMouse[2], nowMouse[1], nowMouse[0] );
    
   stroke(random(255), 64);
    fill(random(255), 32);
    bezier(memMouse[3], memMouse[2], memMouse[1], memMouse[0], nowMouse[3], nowMouse[2], nowMouse[1], nowMouse[0] );
  
    updateMemMouse();
} 


