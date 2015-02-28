
size(400, 400);
background(250);
float x = floor(random(0,8));//these two lines establish variables used to create bold bounding lines, not in for loop
float y = floor(random(0,8));

for (float sqx = 10; sqx < 400; sqx+=50) {//sqx will be my squares X coordinate, starting at 10 and counting upwards by 50
  for (float sqy = 10; sqy < 400; sqy+=50) {//sqy will be squares Y coordinate, counts up by 50 as well
    fill(255,0,0);
    rect(sqx, sqy, 30, 30);//squares will be drawn with the starting coordinates (sqx, sqy) increasing by 50 as long as both sqx and sqy are less than 400
  }
}

for (float lnx = 50; lnx < 400; lnx +=50){//same logic as squares above, only drawing lines now to make grid to fit between squares
  for(float lny = 50; lny <400; lny +=50){
    line(0,lny,height,lny);
    line(lnx,0,lnx,width);
  }
}




strokeWeight(5);
line(x*50,0,x*50,height);//these lines create 2 random bounding lines, reference back to variables established at beginning of code
line(0,y*50,width,y*50);



