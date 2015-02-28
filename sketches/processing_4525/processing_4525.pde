
/*Gnu General Public License v3*/
String s[]=loadStrings
("thisIsHowMuchOfTheLicenseICouldAdd.pde");
textFont(createFont("",50));int i,t=0;
for(i=0;i<s.length;i++){t+=s[i].length()+1;}
text(t-1,0,70);

