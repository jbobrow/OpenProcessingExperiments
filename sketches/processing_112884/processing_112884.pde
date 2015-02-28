
String name = "TEST";
int n = name.length();

size(85,55);
stroke(153);


for ( int q = 0; q < n ; q = q+1){
text(name.charAt(q),(15+(15*q)),15);
}

for ( int q = 0; q < n ; q = q+1){
text(int(name.charAt(q)),(15+(15*q)),30);
}

for ( int q = 0; q < n ; q = q+1){
text("+"+name.charAt(q),(15+(15*q)),45);
}
