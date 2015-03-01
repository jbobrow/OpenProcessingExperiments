
background(0, 150, 190);

{fill(255, 150, 0);  
noStroke(); 
rect(20, 20, 66, 50);  
}

{stroke(190);//assuming there's a better way to create lines below
  line(0, 0, 100, 50);
  line(0, 10, 100, 60);
   line(0, 20, 100, 70);
    line(0, 30, 100, 80);
     line(0, 40, 100, 90);
     line(0, 50, 100, 100);
     line(0, 60, 100, 110);
     line(0, 70, 100, 120);
     line(0, 80, 100, 130);
}

{stroke(0, 150, 190);
strokeWeight(2);
  line(31, 30, 20, 70);
}


{stroke(0, 150, 190);
strokeWeight(2);
  fill(80);
quad(31, 15, 86, 15, 86, 63, 31, 30);

}


