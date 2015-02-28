
String s[]=loadStrings
("codePorn.pde");
 //
  textFont
 (createFont
 ("",8));int i,t=0;
 for(i=0;i<s.length;
i++){text(s[i],0,i*9+9);
t+=s[i].length()+1;}textFont
(createFont("",50));
text(t-1,0,70);

