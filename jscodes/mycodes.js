/*----------------------------------------------------------------------------*/
function returnTextOfFile(file)
{
	var allText='';

    var rawFile = new XMLHttpRequest();
    rawFile.open("GET", file, false);
    rawFile.onreadystatechange = function ()
    {	
        if(rawFile.readyState === 4)
        {
            if(rawFile.status === 200)
            {
                allText = rawFile.responseText;
            }
			if(rawFile.status === 404  || rawFile.status == 0)
			{
				alert('Page no found or not characteristic enable.');
			}
        }
    }
    rawFile.send(null);
    return allText;
}

/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
function removeRowCode(input,divid,idShowBtn) {
    document.getElementById(divid).removeChild( input.parentNode );
	document.getElementById(idShowBtn).style.display='inline';
}


/*----------------------------------------------------------------------------*/
/*
<input id="btn-code-testhbpmf" onclick="addRowCode(this,'code-testhbpmf','examples/extras/testhbpmf.m');sh_highlightDocument();"  type="button" value="See the code" >
<div id="code-testhbpmf"></div>
*/
function addRowCode(input,divid,file) {
    var div = document.createElement('div');

    div.className = 'row';

	var cadena = returnTextOfFile(file);

	cadena='<pre class="sh_octave">\n\n'+cadena +'</pre>';

    div.innerHTML = cadena + '<input type="button" value="Hide the code" onclick="removeRowCode(this,\''+divid+'\',\''+input.id+'\')">';

     document.getElementById(divid).appendChild(div);

	input.style.display='none';
}


/*----------------------------------------------------------------------------*/
/*
<input id="btn-data-testhbpmf" onclick="addRowData(this,'data-testhbpmf','examples/extras/testhbpmf.txt');"  type="button" value="See the desription" >
<div id="data-testhbpmf"></div>
*/
function addRowData(input,divid,file) {
    var div = document.createElement('div');

    div.className = 'row';

	var cadena = returnTextOfFile(file);

    div.innerHTML = cadena + '<input type="button" value="Hide the description" onclick="removeRowCode(this,\''+divid+'\',\''+input.id+'\')">';

     document.getElementById(divid).appendChild(div);

	input.style.display='none';
}



/*----------------------------------------------------------------------------*/
/*
<img id="img-data-testhbpmf" onload="addRowDataAuto('data-testhbpmf','examples/extras/testhbpmf.txt');" src="file.png">
<div id="data-testhbpmf"></div>
*/
function addRowDataAuto(divid,file) {
    var div = document.createElement('div');

    div.className = 'row';

	var cadena = returnTextOfFile(file);

    div.innerHTML = cadena;

    document.getElementById(divid).appendChild(div);
}



