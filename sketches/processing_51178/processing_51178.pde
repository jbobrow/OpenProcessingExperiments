
float xpos;
float ypos;

size (500,500);
fill(0);

xpos = width/2;
ypos = height/2;

/*lefteye*/
quad(xpos-150,ypos-150, xpos-150,ypos-165, xpos-50,ypos-165, xpos-50,ypos-150);
quad(xpos-65,ypos-150, xpos-65,ypos-50, xpos-50,ypos-50, xpos-50,ypos-150);
ellipse(xpos-75,ypos-140, 20,20);

/*righteye*/
quad(xpos+150,ypos-150, xpos+150,ypos-165, xpos+50,ypos-165, xpos+50,ypos-150);
quad(xpos+65,ypos-150,xpos+65,ypos-50, xpos+50,ypos-50, xpos+50,ypos-150);
ellipse(xpos+75,ypos-140, 20,20);

/*mustacheee*/
quad(xpos-200,ypos-50, xpos-200,ypos-65, xpos+200,ypos-65, xpos+200,ypos-50);
ellipse(xpos-175,ypos-65, 50,20);
ellipse(xpos+175,ypos-65, 50,20);

/*whiskies*/
quad(xpos-65,ypos-50, xpos-180,ypos+10, xpos-180,ypos+25, xpos-50,ypos-45);
quad(xpos+65,ypos-50, xpos+165,ypos+150, xpos+150,ypos+160, xpos+50,ypos-50);

/*mouth*/
quad(xpos-65,ypos-50, xpos-65,ypos+30, xpos-50,ypos+30, xpos-50, ypos-50);
quad(xpos+65,ypos-50, xpos+65,ypos+30, xpos+50,ypos+30, xpos+50, ypos-50);
quad(xpos-65,ypos+30, xpos-65,ypos+45, xpos+65,ypos+45, xpos+65, ypos+30);
quad(xpos-65,ypos+200, xpos-65,ypos+215, xpos+65,ypos+215, xpos+65,ypos+200);

