
if (b < 300) {
   
    stroke(255, 0, 0);
    strokeWeight(1);
    fill(255,0,0);
    rect(104, 450, b, 20);
    b = b + 6; 
    b++;
  } else {
   // noLoop();
   fill(255,0,0);
   rect(100, 447, 300, 25);
   textSize(15);
   fill(255);
   text("Loading Complete!", 190, 465); 
   
bass2.pause();  
bass3.pause(); 
bass4.pause(); 
bass5.pause(); 
}
  stroke(255);
  strokeWeight(3);
  noFill();
  rect(100, 447, 300, 25);
}
  
  
  
  

