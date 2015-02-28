
size(1000, 100);
smooth();
float widthDivision = width / 6;
float alphaDivision = 255 / 5;
float rectHeight = height * 0.9;
float rectYCenter = height / 2;
float smallCircleDimension = rectHeight / 2;

// First small
fill(0);
ellipse(widthDivision, rectYCenter, smallCircleDimension, smallCircleDimension);
ellipse(widthDivision * 2, rectYCenter, smallCircleDimension, smallCircleDimension);
ellipse(widthDivision * 3, rectYCenter, smallCircleDimension, smallCircleDimension);
ellipse(widthDivision * 4, rectYCenter, smallCircleDimension, smallCircleDimension);
ellipse(widthDivision * 5, rectYCenter, smallCircleDimension, smallCircleDimension);

// First large
fill(255, alphaDivision);
ellipse(widthDivision, rectYCenter, rectHeight, rectHeight);

// Second large
fill(255, alphaDivision * 2);
ellipse(widthDivision * 2, rectYCenter, rectHeight, rectHeight);

// Third large
fill(255, alphaDivision * 3);
ellipse(widthDivision * 3, rectYCenter, rectHeight, rectHeight);

// Fourth large
fill(255, alphaDivision * 4);
ellipse(widthDivision * 4, rectYCenter, rectHeight, rectHeight);

// Fifth large
fill(255, alphaDivision * 5);
ellipse(widthDivision * 5, rectYCenter, rectHeight, rectHeight);
