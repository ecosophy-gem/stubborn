is_close_to :: (expected: $T, threshold: float64 = 0.000001) -> *Is_Close_To_Matcher(T) {
	matcher := TNew(Is_Close_To_Matcher(T));
        matcher.threshold = threshold;
	matcher.expected = expected;
	return matcher;
}

matches :: (using m: *Is_Close_To_Matcher($T), actual: T) -> bool {
	return is_close_to(actual, expected, threshold);
}

describe :: (using m: *Is_Close_To_Matcher($T), description: *Description) {
	info := type_info(T);
	append(description, "a ");
	append(description, info.type);
	append(description, " is close to ");
	append_value(description, expected);
}

describe_mismatch :: (using m: *Is_Close_To_Matcher($T), actual: T, description: *Description) {
	append(description, "was ");
	append_value(description, actual);
}

#scope_file

Is_Close_To_Matcher :: struct (T: Type) {
	expected: T;
        threshold: float64;
        is_close_to :: (a: T, b: T, threshold: float64) -> bool { return abs(a-b) <= threshold; };
}

#import "Math";
