//Problem 1.

let salaries = {
    John: 100,
    Ann: 160,
    Pete: 130
};

function sumSalaries(obj){
    let sum = 0;
    for(let item in obj){
        sum += obj[item];
    }
    return sum;
}

let sum = sumSalaries(salaries);
console.log(sum);

//Problem 2.

var menu = {
    width: 200,
    height: 300,    
    title: "My menu"
};  

console.log(menu);

function multiplyNumeric(input){
    for(let prop in input){
        if(typeof input[prop] === 'number'){
            input[prop] *= 2;
        }
    }
}

multiplyNumeric(menu);

console.log(menu);

//Problem 3.

function checkEmailId(str){
    let containAt = false;
    let containDot = false;
    for(let i = 0; i < str.length; i++){
        if(str[i] === '@'){
            containAt = true;
        }
        if(str[i] === '.'){
            if(!containAt || str[i-1] === '@'){
                return false;
            }
            containDot = true;
        }
    }
    if(containAt && containDot){
        return true;
    }
    return false;
}

console.log(checkEmailId("2G2iV@example.com"));
console.log(checkEmailId("abc@1.com"));
console.log(checkEmailId("abc.com@gmail.edu"));
console.log(checkEmailId("abc.com@.edu"));

//Problem 4.

function truncate(str, maxlength){
    if(str.length > maxlength){
        return str.slice(0, maxlength-1) + '...';
    }
    return str;
}

console.log(truncate("What I'd like to tell on this topic is:", 20));
console.log(truncate("Hi everyone!", 20));

//Problem 5.
var styles = ['James', 'Brennie']
console.log(styles);
styles.push('Robert');
console.log(styles);

function replaceMiddle(arr, item){
    if(arr.length % 2 === 0){
        console.log('The legnth of the array should be odd');
    }
    arr[(arr.length-1)/2] = item;
}

replaceMiddle(styles, 'Calvin');

console.log(styles);

styles.shift();
console.log(styles);

styles.unshift('Rose', 'Regal');
console.log(styles);