/**
 * 여러줄 주석 
 */
// 한줄 주석
alert("안녕하세요?")
function kor(){
	alert('안녕, 세계!');
}
function eng(){
	alert('Hello, world!');
}
function chn(){
	alert('你好、世界!');
}
function change_title(){
	document.title = prompt("What is the title?", "Title");
}
function change_maindiv(){
	document.getElementById("maindiv").innerHTML =
		prompt("What is the sentence?", "Sentence");
	console.log("HEllo, world!");
	console.log(document.getElementById("maindiv"));
}