function addOne(arr){
	let results = [];
	for( let i =0; i<arr.length; i++){
		results.push(`${arr[i]+1}`);
	}
	return results;
}


function declarativeOne(arr){
    return arr.map((i)=>`${i+1}`);
}