



size(500,500);





background(1);





translate(250,250);





noStroke();





for(float i=0; i<300; i++){





  





  fill(random(255),random(0),random(255));





  rotate(0.9);





  ellipse(i,0,40,40);





  triangle (i+500,0,10,40,i+500,10);
}

