// Dom - Document Object Model

// Selecionar elementos

const  elementoPorId = document.getElementById("meuId");

console.log(elementoPorId);

const elementPorId2 = document.querySelector("#meuId");
console.log(elementPorId2);

const elementPorClasse = document.getElementsByClassName("minhaClasse");
console.log(elementPorClasse);

const elementPorClasse2 = document.querySelector(".minhaClasse");
console.log(elementPorClasse2);

//Manipular conteúdo de texto
const element = document.querySelector("#meuId");
console.log(element.textContent);

element.textContent = "Mudei de texto";

setTimeout(() => {
    element.textContent = "Mudei de texto";
},1000);

//Trabalhando com atributos
const link = document.querySelector("a");
console.log(link);

link.setAttribute("href","https://horadecodar.com.br/cursos");

console.log(link.getAttribute("href"));

console.log(link.hasAttribute("target"));

link.removeAttribute("target"); 

//2:30////
//Manipulacao de classes do CSS
const elemento = document.querySelector("#meuId");

element.classList.add("novaClasse");

element.classList.remove("minhaClasse");

element.classList.toggle("outraClasse");

element.classList.toggle("outraClasse");


// Manipular o CSS

const elemento3 = document.querySelector("#meuId")

elemento3.style.color = "blue";
elemento3.style.backgroundColor = "red";

// background-color => backgroundColor

// Navegação entre nós (navegar entre elementos)
const element4 = document.querySelector("#meuInput");

const pai = element4.parentNode;

console.log(pai);

// Obter o primeiro filho
const primeiroFilho = pai.firstChild;

console.log(primeiroFilho);