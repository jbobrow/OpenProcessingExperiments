
// new declaration //
var t:Timer = new Timer(500);


// new event listeners //
testBtn.addEventListener(MouseEvent.MOUSE_OUT, testHandler); 
testBtn.addEventListener(MouseEvent.MOUSE_OVER, testHandler);
testBtn.addEventListener(MouseEvent.MOUSE_DOWN, testHandler);
testBtn.addEventListener(MouseEvent.MOUSE_UP, testHandler);
timerBtn.addEventListener(MouseEvent.CLICK, setTimer);
t.addEventListener(TimerEvent.TIMER, showSig);


/ new functions
function setTimer(e:Event):void{
    if (t.running){
        t.stop();
        timer.=Btn.label = 'timer (off)';
    }
    else{
        t.start();
        timerBTN.label = 'timer (on)';
    }
}

function showSig(e:Event):void{
    if (timerSig.currentFrameLabel == 'on'){
    timerSig.gotoAndStop('off');
    }
    else{
        timerSig.gotoandStop('on');
    }
}

function testHnadler(e:mouseEvent):void{
    if (e.type == 'mouseOut'){
        e.currentTarget.gotoAndStop('out');
        e.currentTarget.lbl.text = 'out';
    }
    else if (e.typer == 'mouseOver'){
        e.currentTarget.gotoAndStop('over');
        e.currentTarget.lbl.text = 'over';
    }
    else if (e.type == 'mouseDown'){
        e.currentTarget.gotoAndstop('down');
        e.currentTarget.lbl.text = 'down';
        }
    else if (e.type == 'mouseUp'){
        e.currentTarget.gotoAndstop('up');
        e.currentTarget.lbl.text = 'up';
    }
}
