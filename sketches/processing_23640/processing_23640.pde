
/* Piet Mondrian's Composition with Red, Yellow, and Blue */
/* Compositie met, rood, geel, en blauw.                  */
/* Albert J. Nguyễn                                       */
/* March 2011                                             */
/* Originally programmed in Dev-C++.                      */
/* October 2004                                           */



size(420, 444);
background(255);
noStroke();

//yellow//
fill(255, 255, 0);
rect(0.0, 0.0, 50, 97); 

//blue//
fill(0, 0, 255);
rect(56.7, 386, 111, 19); 

//red//
fill(255, 0, 0);
rect(256, 300, 71, 74); 
rect(409, 385, 11, 19); 

//lines//
stroke(0);
strokeWeight(10);
line(54, 0, 54, 444);   //1
line(105, 0, 105, 444); //2
line(141, 0, 141, 444); //3
line(162, 0, 162, 444); //4
line(251, 0, 251, 444); //5
line(331, 0, 331, 444); //6
line(358, 0, 359, 444); //7
line(404, 0, 404, 444); //8

strokeWeight(13);
line(0, 102, 420, 102); //9
line(0, 168, 420, 168); //10
line(0, 224, 420, 224); //11
line(0, 294, 420, 294); //12

strokeWeight(13);
line(254, 379, 355, 379); //13

strokeWeight(10);
line(254, 433, 355, 433); //14

