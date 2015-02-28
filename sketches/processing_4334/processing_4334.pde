
background(255);
smooth();
PShape h=new PShapeSVG(new XMLElement(split(param("archive"),".jar,")[3].replaceAll("[(]","<").replaceAll("[)]",">")));
shape(h,50,-30,50,50);
shape(h,45,200,20,20);

