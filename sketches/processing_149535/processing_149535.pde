
var worker, messageWW = "click to post";
 
// ここに外部ファイル.jsに書くはずのコードを書く
function workersCode(var e){
  var strPost = e.data + "\n"+ e.data;
  self.postMessage( strPost );              //返す
}
 
function setupWW(){
    // workersCode()を無理矢理うめこむ
    var headEl = document.getElementsByTagName("head")[0];
    var scriptEl = document.createElement("script");
    scriptEl.id="worker1";
    scriptEl.type = "javascript/worker";
    var wc = "self.onmessage = function(e)";
    var intwc = workersCode.toString().indexOf( "{" ) ;
    var wc1 = workersCode.toString().substr( intwc );
    scriptEl.innerHTML = wc + wc1;
    headEl.appendChild(scriptEl);
     
  try{
    // blobで埋め込んだコードをスクリプトファイルとして(？)読み込む
    // http://stackoverflow.com/questions/5408406/web-workers-without-a-separate-javascript-file
    var scriptText = new Array();
    scriptText.push(document.querySelector("#worker1").textContent);
    var blob = new Blob(scriptText);
    blob.type = "text/script";
    worker = new Worker(window.URL.createObjectURL(blob));
     
    // メッセージイベントが来たら中身を移す
    eval("worker.onmessage = function(e) {messageWW = e.data;}");
  }catch(IOException e){messageWW = e;}
}
 
void setup(){
  size(384, 128);
  textAlign(CENTER,CENTER);
   
  setupWW();
}
 
void draw(){
  background(0);
  text(messageWW, width/2,height/2);
}
 
void mousePressed(){
  worker.postMessage("hello work.");          // post
}

