
<html><body><pre>

<span style="color: #666666;">//1</span>
<span style="color: #33997E;">void</span> <span style="color: #006699;"><b>setup</b></span>()
{
&nbsp;<span style="color: #006699;">size</span>(800,900);
&nbsp;&nbsp;<span style="color: #006699;">background</span>(#390303);
&nbsp;&nbsp;<span style="color: #006699;">frameRate</span>(1710);
}

<span style="color: #666666;">//25</span>
<span style="color: #33997E;">void</span> <span style="color: #006699;"><b>draw</b></span>()
{
<span style="color: #669900;">for</span>(<span style="color: #E2661A;">int</span> i=1; i&lt;=200; i++);{
<span style="color: #006699;">ellipse</span>(<span style="color: #D94A7A;">width</span>/2,<span style="color: #D94A7A;">height</span>/2,80,200);
<span style="color: #006699;">line</span>(<span style="color: #D94A7A;">mouseX</span>,<span style="color: #D94A7A;">mouseY</span>,<span style="color: #D94A7A;">width</span>/2,<span style="color: #D94A7A;">height</span>/2);
<span style="color: #006699;">stroke</span>(#342ACE);
&nbsp;}
}

</pre></body></html>
