
// Artistic intent: In the first place, I wanted to create a variation of a simple compass rose. I then chose to add portions of circles in order to transform it into an object inspired by spider webs. I therefore concentrated my efforts on the positionning of the shapes rather than the colors and the strokes, as I was working with "silk".
// I originally intended to make a similar piece with more "slices" in the pie, but I felt I could not pull all the calculations and the fine tuning off in the given time, so I kept it simple in the end (you might see it's not perfectly accurate due to my lousy rounding approximations).


//Setup
size(800, 800);
background(#6A4B24);
smooth();
noFill();


//Unused object --> turns into a sort of dreamcatcher thing if you uncomment
//stroke(#FAF8F5);
//ellipse(400, 400, 400, 400);


//spikes
  //north
stroke(#EAE7E3);
quad(400, 400, 441.42, 300, 400, 200, 358.58, 300);
  //east
stroke(#F5ECE1);
quad(400, 400, 500, 358.58, 600, 400, 500, 441.42);
  //south
stroke(#EDEAE6);
quad(400, 400, 441.42, 500, 400, 600, 358.58, 500);
  //west
stroke(#F0E7DC);
quad(400, 400, 300, 358.58 , 200, 400, 300, 441.42);

    //north-east
stroke(#FAEFE1);
quad(400, 400, 441.42, 300, 541.42, 258.58, 500, 358.58);
    //south-east
stroke(#FAF5F0);
quad(400, 400, 500, 441.42, 541.42, 541.42, 441.42, 500);
    //south-west
stroke(#F0EEED);    
quad(400, 400, 358.58, 500, 258.58, 541.42, 300, 441.42);
    //north-west
stroke(#FCF1E3);
quad(400, 400, 358.58, 300, 258.58, 258.58, 300, 358.58);


//circular portions
  //north
stroke(#FFFDFA);
arc(400, 200, 216.48, 216.48, 1.178, 1.962);
  //east
stroke(#F5EFE8);
arc(600, 400, 216.48, 216.48, 2.749, 3.535);
  //south
stroke(#FFF7ED);
arc(400, 600, 216.48, 216.48, 4.320, 5.105);
  //west
stroke(#FFF2E3);
arc(200, 400, 216.48, 216.48, -0.393, 0.393);

    //north-east
stroke(#F5EDE3);
arc(541.42, 258.58, 216.48, 216.48, 1.962, 2.749);
    //south-east
stroke(#F2F2F2);
arc(541.42, 541.42, 216.48, 216.48, 3.535, 4.320);
    //south-west
stroke(#F7F7F7);
arc(258.58, 541.42, 216.48, 216.48, 5.105, 5.890);
    //north-west
stroke(#FFEFDB);
arc(258.58, 258.58, 216.48, 216.48, 0.393, 1.178);


//supporting lines
   //vertical
stroke(#F2E8DC);
line(400, 0, 400 , 800);
   //horizontal
stroke(#E8E6E3);
line(0, 400, 800 , 400);
    // \
stroke(#F7F3ED);
line(0, 0, 800, 800);
    // /
stroke(#FAF2E8);
line(0, 800, 800, 0);


