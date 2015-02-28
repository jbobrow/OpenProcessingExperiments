
//Official Property of Derek Gryga
//Generated 6 February 2013
//Edited 12 February 2013
//"A Piece of Picasso"
println("'A Piece of Picasso'");
size(182,278);        //Image size in pixels.
background(8,132,197);//Sky Background color.
fill(191,150,2);      //Color of the house wall.
strokeWeight(8);      //Stroke of outline of wall of house.  Confusing?
rect(132,51,50,225);  //House wall
strokeWeight(8);      //Roofing stroke (line width).
fill(127,27,8);       //Roofing Fill color.
beginShape();         //Roofing for the house.
vertex(181,48);  
vertex(121,80);
vertex(130,80);
vertex(130,91);
vertex(107,91);
vertex(96,87);
vertex(97,67);
vertex(103,58);
vertex(123,54);
vertex(117,62);
vertex(181,24);
endShape(CLOSE);        //End of Roofing shape.
strokeWeight(10);       //Stroke for bottom dark line(land).
fill(0,0,0);            //Fill for land (none).
beginShape();           //Land starts from low corner of wall.
vertex(128,272);
vertex(9,281);
vertex(2,264);
endShape();             //END OF LAND SHAPE.
strokeWeight(0);        //Stroke Weight of tan colored shape behind window.
fill(200,175,109);      //Color of tan shape behind window.
rect(147,128,36,149);   //Behind-the-window-shape.
fill(89,52,5);          //Color of brown window.
rect(147,143,34,115);   //Brown window.
strokeWeight(0);        //Stroke weight of Top window trapezoid.
fill(191,150,2);        //color of Top window trapezoid.
beginShape();           //Top window trapezoid.
vertex(161,164);
vertex(170,164);
vertex(173,169);
vertex(161,169);
endShape(CLOSE);        //Top window trapezoid.
fill(191,150,2);        //Fill color of 2nd window trapezoid.
beginShape();           //2nd window trapezoid.
vertex(159,183);
vertex(174,183);
vertex(175,196);
vertex(159,196);
endShape(CLOSE);        //2nd window shape ends.
beginShape();           //3rd window shape begins.
vertex(160,212);
vertex(175,212);
vertex(176,220);
vertex(161,220);
endShape(CLOSE);        //3rd window shape ends.
beginShape();           //Bottom window shape starts.
vertex(158,234);
vertex(172,234);
vertex(175,239);
vertex(161,239);
endShape(CLOSE);        //Bottom window shape ends.
fill(37,19,2);          //Fill color for black window shape (brownish,black-ish).
strokeWeight(7);        //Stroke weight for black window shape.
beginShape();           //Black window shape begins.
vertex(144,157);
vertex(160,164);
vertex(164,181);
vertex(163,254);
vertex(141,244);
vertex(141,163);
endShape(CLOSE);        //Black window shape ends.
fill(56,73,19);         //Fill color of green window shape (green).
strokeWeight(0);        //Stroke Weight of green window shape.
beginShape();           //Top Green window shap begins.
vertex(142,166);
vertex(156,170);
vertex(156,178);
vertex(141,173);
endShape(CLOSE);        //Top Green window shape ends.
beginShape();           //2nd Green window shape begins.
vertex(144,183);
vertex(158,190);
vertex(155,197);
vertex(141,190);
endShape(CLOSE);        //2nd green window shape ends.
beginShape();           //3rd green window shape begins.
vertex(143,200);
vertex(157,208);
vertex(157,215);
vertex(141,207);
endShape(CLOSE);        //3rd green window shape ends.
beginShape();           //4th green window shape begins.
vertex(144,224);
vertex(157,229);
vertex(153,239);
vertex(142,233);
endShape(CLOSE);        //4th green window shape ends.
beginShape();           //Bottom green window shape begins.
vertex(142,241);
vertex(158,248);
vertex(152,254);
vertex(142,246);
endShape(CLOSE);        //Bottom green window shape ends.
fill(254,254,254);      //White sail shape fill color (white).
noStroke();        //Stroke weight of white sail shape (none).
beginShape();           //White sail shape begins
vertex(37,230);
vertex(38,260);
vertex(30,275);
vertex(24,270);
vertex(23,266);
vertex(25,265);
vertex(35,241);
vertex(34,235);
vertex(35,231);
endShape(CLOSE);        //White sail shape ends.
fill(36,133,80);        //Left Side Green Shape fill color green-blue.
strokeWeight(0);        //Left Side Green Shape stroke weight, none.
beginShape();           //Left Side Green Shape begins.
vertex(1,159);
vertex(5,179);
vertex(12,185);
vertex(6,202);
vertex(28,233);
vertex(4,238);
vertex(0,238);
endShape(CLOSE);        // Left Side Green Shape ends.
fill(254,254,254);      // Cloud shapes color.
beginShape();           // Cloud Shape 1 begins.  CLoud shape go from left to right, top to bottom.
vertex(0,35);
vertex(4,51);
vertex(1,50);
vertex(0,42);
endShape(CLOSE);
beginShape();
vertex(12,48);
vertex(16,52);
vertex(13,66);
vertex(9,61);
vertex(10,55);
endShape(CLOSE);
beginShape();
vertex(26,64);
vertex(31,63);
vertex(35,64);
vertex(32,66);
vertex(31,76);
vertex(25,73);
vertex(25,64);
endShape(CLOSE);
beginShape();
vertex(33,72);
vertex(38,75);
vertex(39,93);
vertex(30,85);
vertex(32,80);
vertex(31,73);
endShape(CLOSE);
beginShape();
vertex(50,74);
vertex(52,74);
vertex(53,101);
vertex(46,98);
vertex(44,86);
vertex(48,83);
endShape(CLOSE);
beginShape();
vertex(61,91);
vertex(64,91);
vertex(65,96);
vertex(69,98);
vertex(65,100);
vertex(64,112);
vertex(57,105);
vertex(56,101);
vertex(60,97);
endShape(CLOSE);
beginShape();
vertex(74,98);
vertex(76,99);
vertex(81,105);
vertex(78,109);
vertex(78,119);
vertex(74,124);
vertex(71,118);
vertex(71,112);
vertex(71,106);
vertex(73,104);
endShape(CLOSE);
beginShape();
vertex(86,108);
vertex(89,108);
vertex(91,118);
vertex(94,119);
vertex(91,122);
vertex(92,127);
vertex(89,135);
vertex(93,135);
endShape(CLOSE);
beginShape();
vertex(106,139);
vertex(111,140);
vertex(113,152);
vertex(113,164);
vertex(100,161);
vertex(100,153);
vertex(108,150);
endShape(CLOSE);
beginShape();
vertex(116,158);
vertex(119,159);
vertex(121,169);
vertex(118,173);
vertex(115,170);
endShape(CLOSE);
beginShape();
vertex(33,111);
vertex(34,118);
vertex(36,134);
vertex(26,133);
vertex(28,126);
endShape(CLOSE);
beginShape();
vertex(46,123);
vertex(49,123);
vertex(49,131);
vertex(43,136);
endShape(CLOSE);
beginShape();
vertex(53,143);
vertex(63,140);
vertex(63,149);
vertex(63,153);
vertex(58,153);
vertex(58,153);
vertex(52,155);
vertex(55,148);
endShape(CLOSE);
beginShape();
vertex(71,146);
vertex(80,148);
vertex(81,152);
vertex(75,147);
vertex(76,166);
vertex(66,166);
vertex(65,156);
vertex(71,154);
endShape(CLOSE);
fill(71,155,166);
beginShape();
vertex(84,156);
vertex(81,161);
vertex(85,166);
vertex(86,168);
vertex(82,180);
vertex(76,174);
vertex(81,163);
endShape(CLOSE);
beginShape();
vertex(88,159);
vertex(86,156);
vertex(93,156);
vertex(100,163);
vertex(97,167);
vertex(94,183);
vertex(88,173);
vertex(90,166);
endShape(CLOSE);
beginShape();
vertex(103,165);
vertex(104,152);
vertex(107,172);
vertex(107,183);
vertex(103,184);
vertex(100,175);
vertex(104,169);
endShape(CLOSE);
beginShape();
vertex(114,181);
vertex(120,177);
vertex(121,180);
vertex(124,210);
vertex(117,210);
vertex(116,201);
vertex(114,201);
vertex(109,191);
endShape(CLOSE);
beginShape();
vertex(120,212);
vertex(123,212);
vertex(124,220);
vertex(120,223);
endShape(CLOSE);
beginShape();
vertex(0,125);
vertex(8,127);
vertex(9,134);
vertex(7,141);
endShape(CLOSE);
beginShape();
vertex(18,139);
vertex(22,147);
vertex(19,153);
vertex(15,144);
endShape(CLOSE);
beginShape();
vertex(25,152);
vertex(28,153);
vertex(29,163);
vertex(28,168);
vertex(23,168);
vertex(25,160);
endShape(CLOSE);
beginShape();
vertex(33,173);
vertex(35,173);
vertex(35,186);
vertex(29,186);
vertex(30,178);
vertex(31,175);
endShape(CLOSE);
beginShape();
vertex(45,184);
vertex(47,184);
vertex(47,190);
vertex(50,196);
vertex(48,203);
endShape(CLOSE);
beginShape();
vertex(60,193);
vertex(60,198);
vertex(64,206);
vertex(58,209);
vertex(57,209);
vertex(57,203);
endShape(CLOSE);
beginShape();
vertex(77,202);
vertex(82,205);
vertex(78,212);
vertex(80,218);
vertex(80,223);
vertex(72,221);
vertex(73,216);
vertex(76,207);
endShape(CLOSE);
beginShape();
vertex(92,210);
vertex(94,210);
vertex(97,227);
vertex(88,228);
vertex(91,220);
vertex(87,217);
vertex(94,219);
endShape(CLOSE);
beginShape();          //Bottom Right cloud shape.
vertex(106,226);
vertex(112,228);
vertex(112,236);
vertex(106,236);
endShape(CLOSE);       //Bottom Right cloud shape.
